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
import whou.secproject.repository.AptitudeApiDAO;
import whou.secproject.service.AptitudeService;

@Controller
@RequestMapping("/aptitude")
public class AptitudeController {
	
	@Autowired
	private AptitudeApiDAO dao;

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
	public String getAptitudeTestResult(Model model, String countQ, HttpServletRequest request, HttpServletResponse response) {
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
		model.addAttribute("reportResult", reportResult);
		
		
		System.out.println(aptiTestResultResponse.getRESULT().getUrl());
		return "/aptitude/report";
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
}
