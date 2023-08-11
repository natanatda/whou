package whou.secproject.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import whou.secproject.service.WhouModelCustomService;
import whou.secproject.service.WhouModelService;

@Controller
@RequestMapping("/aptitude")
public class AptitudeController {
	
	@Autowired
	private AptitudeApiDAO dao;
	
	@Autowired
	private JobDicApiDAO daoJob;

	@Autowired
	private AptitudeService service;
	
	@Autowired
	private WhouModelCustomService whouModelCustomService;
	
	@Autowired
	private WhouModelService whouModelService;
	
	@RequestMapping("/intro")
    public String intro(HttpServletRequest request,Model model) {
		int load = Integer.parseInt(request.getParameter("load"));
		model.addAttribute("load", load);
		int qnum = Integer.parseInt(request.getParameter("qnum"));
		model.addAttribute("load", load);
		model.addAttribute("qnum", qnum);
        return "/aptitude/intro";
    }
	
	//설문지 출력하기
	@RequestMapping("/itrstkAptitude")
	public String getAptitudeTestByNum(Model model, HttpServletRequest request) throws IOException {
		String qnum = request.getParameter("qnum");
	    model.addAttribute("RESULT", dao.getAptitudeTestByNum(qnum).getRESULT());
	    model.addAttribute("qnum", qnum);
	    HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		// user_info 테이블에서 세션에 해당하는 num 추출
		int userNum = service.userNumSelect(memId);
	    
		
	    //임시 저장한 설문지로 들어온 경우
	    String tempSave= request.getParameter("tempSave")!= null?request.getParameter("tempSave"):"";
//	    tempSave = request.getParameter("tempSave");
	    List<String> arrList = new ArrayList<>();
	    
	    if(tempSave.equals("tempSave")) {
	    	List<AptitudeTestTemporarySaveDTO> tempList = null;
	    	AptitudeTestTemporarySaveDTO tempDTO = new AptitudeTestTemporarySaveDTO();
	    	tempDTO.setTest_num(Integer.parseInt(qnum));
	    	tempDTO.setUserNum(userNum);
	    	tempList = service.getTemporarySave(tempDTO);
	    	String[] arr = tempList.get(0).getTest_answers().split(" ");
	    	for(String s:arr) {
	    		String delstr = s.substring(0, s.indexOf("=")+1);
	    		arrList.add(s.replace(delstr,""));
	    	}
	    }
	    model.addAttribute("arrList", arrList);
	    
		String email = (String)session.getAttribute("memId");
		
		if(email != null) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
			userNum=service.userNumSelect(email);
		}
		int brush = 995;
		model.addAttribute("brush", whouModelService.selectModel(brush)); // 붓 장착
		
	    return "/aptitude/itrstkAptitude";
	}
	public static String listToString(List<String> list, String delimiter) {
		return String.join(delimiter, list);
	}
	//크롤링 결과 집어넣기
	@RequestMapping("/report")
	public String getAptitudeTestResult(Model model, String countQ, HttpServletRequest request, HttpServletResponse response, JobDicParamDTO jParam, RecommandInfoDTO dtoRe) {
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		// user_info 테이블에서 세션에 해당하는 num 추출
		int userNum = service.userNumSelect(memId);
		List<String>answers = new ArrayList<>();
		String qnum = request.getParameter("qnum");
		model.addAttribute("qnum", qnum);
		
		// 퍼센트 정보 추가하기
		int [] percents = service.getPercent(userNum);
		String percentStr = request.getParameter("percent");
		int percent = 0;
		if(percentStr!=null) {
			percent = Integer.parseInt(percentStr);
		}
		if(qnum.equals("21")) percents[0] = 0;
		else if(qnum.equals("25")) percents[1] = 0;
		else if(qnum.equals("27")) percents[2] = 0;
		else if(qnum.equals("31")) percents[3] = 0;
		
		service.updatePercent(userNum, percents);
		
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
			service.temporarySaveDelete(Integer.parseInt(qnum), userNum);
		}
		
		
		
		// 크롤링한 값을 dto에 set
		AptitudeTestValueDTO dto = new AptitudeTestValueDTO();
		
		dto = service.testCrawling(testURL, qnum);
		dto.setTest_num(Integer.parseInt(qnum));
		dto.setTest_answers(answers.toString());
		
		service.crawlingInsert(dto, userNum);
		List<String> reportResult = service.reportView(qnum, dto);
		List<String[]> reportResultArr = service.crawlingSplitArr(dto,qnum);
		List<String> testJob = service.crawlingSplitJob(dto,qnum);
		
		// 검사 결과지에서 추천을 위해 추천테이블에 넣을 정보
		
			
			int userCount = service.userNumCount(userNum);
			if(userCount == 0) {
				service.userNumInsert(userNum);	
			}
			
			// 흥미검사 결과지의 직업 리스트의 code 추출 - 흥미31
			StringBuilder sb = new StringBuilder();
			
			if(qnum.equals("31")) {
				dtoRe.setInterest_name1(testJob.get(0));
				dtoRe.setInterest_name2(testJob.get(1));
				dtoRe.setInterest_name3(testJob.get(2));
				for(int i = 0; i < reportResultArr.size(); i++) {
					for(int j = 0; j <reportResultArr.get(i).length; j++) {
						String jobListItem = reportResultArr.get(i)[j].toString();
						String interesteJob = service.jobSelect(jobListItem);
						 if(j==0) {
							 sb.append(interesteJob);
						  }else{
							  sb.append(",").append(interesteJob);
						  }
					}		
					if(i == 0) dtoRe.setInterest_job1(sb.toString());	
					else if(i  == 1) dtoRe.setInterest_job2(sb.toString());
					else if(i == 2 ) dtoRe.setInterest_job3(sb.toString());
					sb.delete(0, sb.length());
				}
				dtoRe.setInterest_score(dto.getTest31_2());
				service.interestUpdate(dtoRe,userNum);
			}
			
		
			// 적성검사 결과지의 높은 적성 top3 - 적성21
			if(qnum.equals("21")) {
				String sortName = "";
				String sortValue = "";
				List<String> topList = service.crawlingSplitRank(dto, qnum);
				int num = 0;
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
						jdlrDTO = daoJob.getJobDicListSorted(jParam);
						for(int j = 0; j < jdlrDTO.getJobs().size(); j++) {
							jobListCd[(i-1)*10+j] = jdlrDTO.getJobs().get(j).getJob_cd()+"";
						}
					}
					String jobListCode = String.join(",", jobListCd);
					if(num == 0) {
						dtoRe.setAptitude_name1(list);
						dtoRe.setAptitude_job1(jobListCode);
					}
					if(num == 1) {
						dtoRe.setAptitude_name2(list);
						dtoRe.setAptitude_job2(jobListCode);
					}
					if(num == 2) {
						dtoRe.setAptitude_name3(list);
						dtoRe.setAptitude_job3(jobListCode);
					}
					num++;
				}
				dtoRe.setAptitude_score(dto.getTest21_2());
				service.aptitudeUpdate(dtoRe,userNum);
			
			}
			
			List<String> updatedList1 = new ArrayList<>();
			List<String> updatedList2 = new ArrayList<>();
			List<String> updatedList3 = new ArrayList<>();
			String[] updatedList4 = new String[12];
			if (qnum.equals("27")) {
				// chart 값 추출		
				for(int i = 4; i <= 10; i += 2) {
					String element = reportResult.get(i);
					updatedList1.add(element);
				}
				for(int i = 12; i <= 22; i += 2 ) {
					String element = reportResult.get(i);
					updatedList2.add(element);
				}
				
				// 역량 점수만 저장
				String abilityScore = listToString(updatedList1, ",");
				abilityScore += "," + listToString(updatedList2, ",");
				service.saveAbilityScore(abilityScore, userNum);
			}
			if (qnum.equals("25")) {
				for(int i = 3; i <= 14; i++ ) {
					updatedList4[i-3] = reportResult.get(i);
					String element = reportResult.get(i);
					updatedList3.add(element);
				}
				String score = String.join(",", updatedList4);
				service.valuesUpdate(score, userNum);
			
			}
			// 검사할때마다 userinfo에 1로 업데이트
			service.commendNumUpdate(memId);
		model.addAttribute("updatedList1", updatedList1);
		model.addAttribute("updatedList2", updatedList2);
		model.addAttribute("updatedList3", updatedList3);	
		model.addAttribute("reportResult", reportResult);
		model.addAttribute("reportResultArr", reportResultArr);
		model.addAttribute("percent",service.crawlingSplit(dto,qnum));
		model.addAttribute("aptitudeName",service.crawlingSplitScoreName(dto,qnum,userNum));
		model.addAttribute("rank",service.crawlingSplitRank(dto,qnum));
		model.addAttribute("job",service.crawlingSplitJob(dto,qnum));

		

		
		String email = (String)session.getAttribute("memId");
	
		if(email != null) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
			userNum=service.userNumSelect(email);
		}
		int brush = 995;
		model.addAttribute("brush", whouModelService.selectModel(brush)); // 붓 장착
		
		return "/aptitude/report";
    }

	//임시저장하기
	@RequestMapping("/temporarySave")
	public String temporaryResult(Model model, String countQ, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		List<String>answers = new ArrayList<>();
		String qnum = request.getParameter("qnum");
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		// user_info 테이블에서 세션에 해당하는 num 추출
		int userNum = service.userNumSelect(memId);
		
		
		// 퍼센트 정보 추가하기
		int [] percents = service.getPercent(userNum);
		String percentStr = request.getParameter("percent");
		int percent = 0;
		if(percentStr!=null) {
			percent = Integer.parseInt(percentStr);
		}
		if(qnum.equals("21")) percents[0] = percent;
		else if(qnum.equals("25")) percents[1] = percent;
		else if(qnum.equals("27")) percents[2] = percent;
		else if(qnum.equals("31")) percents[3] = percent;
		for(int a : percents) {
		}
		service.updatePercent(userNum, percents);
		
		//검사25의 49번 문제 예외처리
    	for(int i=1; i<=Integer.parseInt(countQ);i++) {
    		if(qnum.equals("25") && i==49) {
				answers.add(request.getParameter("selectedValues"));
    		}else {
				answers.add(request.getParameter("btnradio"+i));
    		}
    	}
    	
    	
    	AptitudeTestTemporarySaveDTO dto = new AptitudeTestTemporarySaveDTO();
    	
    	String tempSave = request.getParameter("tempSave");
    	
//		List<String>answers2 = new ArrayList<>();
//		for(int i=0; i < 153; i++) {
//			String str = (int)(Math.random()*4+1)+"";
//			answers2.add(str);
//		}
//		answers = answers2;
    	//임시 저장한 걸 다시 임시 저장한 경우
		if(tempSave.equals("tempSave")) {
			service.temporarySaveUpdate(answers, dto, qnum, userNum);
		}

		
		// 첫 임시 저장
		if(tempSave==null || tempSave.equals(null) || tempSave.equals("")){
			dto.setTest_num(Integer.parseInt(qnum));
			dto.setUserNum(userNum);
			List<AptitudeTestTemporarySaveDTO> count = service.getTemporarySave(dto);
			//임시저장한 것이 있음에도 다시 새로 작성하여 저장하려고 할 때
			if(count.size()==1) {
				service.temporarySaveUpdate(answers, dto, qnum, userNum);
			}
			if(count.size()==0){
				service.temporarySaveInsert(answers, dto, qnum, userNum);
			}
		}
    	
		
    	return "redirect:/aptitude/aptitudeMain?temporarySave=okSave";
	}
		
		
		
		
	//검사 횟수와 일자, 임시저장 값 꺼내기
	@RequestMapping("/aptitudeMain")
	public String aptitudeMain(Model model, AptitudeTestValueDTO dto1, AptitudeTestTemporarySaveDTO dto2, HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		if(memId != null) {
			// user_info 테이블에서 세션에 해당하는 num 추출
			int userNum = service.userNumSelect(memId);
			
			// 세션으로 이름 꺼내기
			String name = service.getName(memId);
			model.addAttribute("name",name);
			
			//진행한 검사
			List<AptitudeTestValueDTO> valueList = service.getRecentTest(dto1, userNum);
			int [] valueCountArr = {0,0,0,0};
			String [] valueDateArr = {"-","-","-","-"}; 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for (int i = 0; i < valueList.size() && i < 4; i++) {
			    AptitudeTestValueDTO testValue = valueList.get(i);
			    int testNum = testValue.getTest_num();
			    Timestamp timestamp = testValue.getMax_test_date();
			    Date date = new Date(timestamp.getTime());
			    if(testNum == 21) {
			    	valueCountArr[0] = testValue.getCount();
			    	valueDateArr[0] = sdf.format(date);
			    }
			    if(testNum == 25) {
			    	valueCountArr[1] = testValue.getCount();
			    	valueDateArr[1] = sdf.format(date);
			    }
			    if(testNum == 27) {
			    	valueCountArr[2] = testValue.getCount();
			    	valueDateArr[2] = sdf.format(date);
			    }
			    if(testNum == 31) {
			    	valueCountArr[3] = testValue.getCount();
			    	valueDateArr[3] = sdf.format(date);
			    }
			}
			model.addAttribute("valueCountArr", valueCountArr);
			model.addAttribute("valueDateArr", valueDateArr);
			model.addAttribute("valueList", valueList);
			
			//임시 저장한 모든 값 가져오기
			dto2.setUserNum(userNum);
			List<AptitudeTestTemporarySaveDTO> tempList = service.getTemporarySave(dto2);
			model.addAttribute("tempList", tempList);
		}
	
		
		//임시 저장하고 메인화면으로 온건지 판별
		String temporarySave = request.getParameter("temporarySave");
		model.addAttribute("temporarySave", temporarySave);
		
	
		
    	return "/aptitude/aptitudeMain";
	}
	
}



