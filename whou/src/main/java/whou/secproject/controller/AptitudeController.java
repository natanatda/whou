package whou.secproject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.AptitudeTestResultResponseDTO;
import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTO;
import whou.secproject.component.JobDicListResponseDTO;
import whou.secproject.component.JobDicParamDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.repository.AptitudeApiDAO;
import whou.secproject.repository.JobDicApiDAO;
import whou.secproject.service.AptitudeService;

@Controller
@RequestMapping("/aptitude")
public class AptitudeController {
	
	@Autowired
	private AptitudeApiDAO dao;
	
	@Autowired
	private JobDicApiDAO daoJob;

	@Autowired
	private AptitudeService service;
	
	
	//설문지 출력하기
	@RequestMapping("/itrstkAptitude")
	public String getAptitudeTestByNum(Model model, HttpServletRequest request) throws IOException {
		String qnum = request.getParameter("qnum");
		System.out.println(qnum);
	    model.addAttribute("RESULT", dao.getAptitudeTestByNum(qnum).getRESULT());
	    model.addAttribute("qnum", qnum);
	    
	    //임시 저장한 설문지로 들어온 경우
	    String tempSave="";
	    tempSave = request.getParameter("tempSave");
	    List<String> arrList = new ArrayList<>();
	    
	    if(tempSave == null) {
	    	tempSave="";
	    }
	    
	    if(tempSave.equals("tempSave")) {
	    	List<AptitudeTestTemporarySaveDTO> tempList = null;
	    	AptitudeTestTemporarySaveDTO tempDTO = new AptitudeTestTemporarySaveDTO();
	    	tempDTO.setTest_num(Integer.parseInt(qnum));
	    	tempList = service.getTemporarySave(tempDTO);
	    	String[] arr = tempList.get(0).getTest_answers().split(" ");
	    	for(String s:arr) {
	    		String delstr = s.substring(0, s.indexOf("=")+1);
	    		arrList.add(s.replace(delstr,""));
	    	}
	    }
	    model.addAttribute("arrList", arrList);
	    
	    return "/aptitude/itrstkAptitude";
	}
	
	//크롤링 결과 집어넣기
	@RequestMapping("/report")
	public String getAptitudeTestResult(Model model, String countQ, HttpServletRequest request, HttpServletResponse response, JobDicParamDTO jParam, RecommandInfoDTO dtoRe) {
		List<String>answers = new ArrayList<>();
		String qnum = request.getParameter("qnum");
		model.addAttribute("qnum", qnum);
		
		//검사25의 49번 문제 예외처리
    	for(int i=1; i<=Integer.parseInt(countQ);i++) {
    		if(qnum.equals("25") && i==49) {
    			answers.add(request.getParameter("selectedValues"));
    		}else {
    			answers.add(request.getParameter("btnradio"+i));
    		}
    	}
		AptitudeTestResultResponseDTO aptiTestResultResponse = dao.getAptitudeTestResult(answers, qnum);
		String testURL = aptiTestResultResponse.getRESULT().getUrl();
		
		
		//임시 저장한 것을 불러와 제출한 경우
		String tempSave = request.getParameter("tempSave");
		if(tempSave.equals("tempSave")) {
			service.temporarySaveDelete(Integer.parseInt(qnum));
		}
		
		
		
		// 크롤링한 값을 dto에 set
		AptitudeTestValueDTO dto = new AptitudeTestValueDTO();
		
		dto = service.testCrawling(testURL, qnum);
		dto.setTest_num(Integer.parseInt(qnum));
		dto.setTest_answers(answers.toString());
		
		service.crawlingInsert(dto);
		List<String> reportResult = service.reportView(qnum, dto);
		List<String[]> reportResultArr = service.crawlingSplitArr(dto,qnum);
		List<String> testJob = service.crawlingSplitJob(dto,qnum);
		// 검사 결과지에서 추천을 위해 추천테이블에 넣을 정보
			// 흥미검사 결과지의 직업 리스트의 code 추출 - 흥미31
			StringBuilder sb = new StringBuilder();
			
			if(qnum.equals("31")) {
				dtoRe.setIntereste_name1(testJob.get(0));
				dtoRe.setIntereste_name2(testJob.get(1));
				dtoRe.setIntereste_name3(testJob.get(2));
				System.out.println("@!#@#!@#! : " + testJob);
				for(int i = 0; i < reportResultArr.size(); i++) {
					for(int j = 0; j <reportResultArr.get(i).length; j++) {
						String jobListItem = reportResultArr.get(i)[j].toString();
//						System.out.println("%%%%%%%%%%%%%%%%%%%%: " + jobListItem);
						String interesteJob = service.jobSelect(jobListItem);
						sb.append(interesteJob).append(",");
					}		
					if(i == 0) dtoRe.setIntereste_job1(sb.toString());	
					else if(i  == 1) dtoRe.setIntereste_job2(sb.toString());
					else if(i == 2 ) dtoRe.setIntereste_job3(sb.toString());
					System.out.println("%%%%%%%%%%%%%%%%%%%%: "+ sb);
					sb.delete(0, sb.length());
				}
				service.interesteInsert(dtoRe);
				
			}
			
		
			// 적성검사 결과지의 높은 적성 top3 - 적성21
			if(qnum.equals("21")) {
				String sortName = "";
				String sortValue = "";
				List<String> topList = service.crawlingSplitRank(dto, qnum);
				
				for(String list : topList) {
					sortName = list;
					sortValue = service.aptdSelect(sortName);
					jParam.setSearchAptdCodes(sortValue);
					jParam.setPageIndex("1");
					JobDicListResponseDTO jdlrDTO = daoJob.getJobDicListSorted(jParam);	
					int total = jdlrDTO.getCount();
					int count = total / 10;
					String [] jobListCd = new String[total];

					
					for(int i = 1; i <= count+1; i++) {
						jParam.setPageIndex(i+"");
//						System.out.println(jParam.getPageIndex());
						jdlrDTO = daoJob.getJobDicListSorted(jParam);
						for(int j = 0; j < jdlrDTO.getJobs().size(); j++) {
							jobListCd[(i-1)*10+j] = jdlrDTO.getJobs().get(j).getJob_cd();
						}
					}
					String jobListCode = String.join(",", jobListCd);
					System.out.println("@@@@@@@@@@@@@@@@@@@@ 적성 코드: "+ jobListCode);
				}
			
			}
			
			
			
		model.addAttribute("reportResult", reportResult);
		model.addAttribute("reportResultArr", reportResultArr);
		model.addAttribute("percent",service.crawlingSplit(dto,qnum));
		model.addAttribute("rank",service.crawlingSplitRank(dto,qnum));
		model.addAttribute("job",service.crawlingSplitJob(dto,qnum));

		
		System.out.println(aptiTestResultResponse.getRESULT().getUrl());
		return "/aptitude/report";
    }
	
	@RequestMapping("/test")
	public String select(HttpServletRequest request) {
		String qnum = request.getParameter("qnum");
		AptitudeTestValueDTO dto = new AptitudeTestValueDTO();
		List<String[]> reportResultArr = service.crawlingSplitArr(dto,qnum);
	
		return "dd";
	}
	//임시저장하기
	@RequestMapping("/temporarySave")
	public String temporaryResult(Model model, String countQ, HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<String>answers = new ArrayList<>();
		String qnum = request.getParameter("qnum");
		
		//검사25의 49번 문제 예외처리
    	for(int i=1; i<=Integer.parseInt(countQ);i++) {
    		if(qnum.equals("25") && i==49) {
				answers.add(request.getParameter("selectedValues"));
    		}else {
				answers.add(request.getParameter("btnradio"+i));
    		}
    	}
    	System.out.println("임시저장"+answers);
    	
    	AptitudeTestTemporarySaveDTO dto = new AptitudeTestTemporarySaveDTO();
    	
    	String tempSave = request.getParameter("tempSave");
    	
    	
    	//임시 저장한 걸 다시 임시 저장한 경우
		if(tempSave.equals("tempSave")) {
			service.temporarySaveUpdate(answers, dto, qnum);
		}

		
		// 첫 임시 저장
		if(tempSave==null || tempSave.equals(null)){
			service.temporarySaveInsert(answers, dto, qnum);
		}
    	
		
    	return "redirect:/aptitude/aptitudeMain?temporarySave=okSave";
	}
		
		
		
		
	//검사 횟수와 일자, 임시저장 값 꺼내기
	@RequestMapping("/aptitudeMain")
	public String aptitudeMain(Model model, AptitudeTestValueDTO dto1, AptitudeTestTemporarySaveDTO dto2, HttpServletRequest request) throws IOException {
		
		//진행한 검사
		List<AptitudeTestValueDTO> valueList = service.getRecentTest(dto1);
		model.addAttribute("valueList", valueList);
		
		//임시 저장
		List<AptitudeTestTemporarySaveDTO> tempList = service.getTemporarySave(dto2);
		model.addAttribute("tempList", tempList);
		
		//임시 저장하고 메인화면으로 온건지 판별
		String temporarySave = request.getParameter("temporarySave");
		model.addAttribute("temporarySave", temporarySave);
		
		
    	return "/aptitude/aptitudeMain";
	}
	
//	@RequestMapping("/test")
//	public String test() {
//		String result = "";
//		result = service.valuesJob();
//		service.valuesInsert(result);
//		return "/test";
//	}
}
