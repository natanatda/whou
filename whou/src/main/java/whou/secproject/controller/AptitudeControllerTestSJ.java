package whou.secproject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.AptitudeTestResultResponseDTO;
import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTOSJ;
import whou.secproject.repository.AptitudeApiTestSJDAO;
import whou.secproject.service.AptitudeServiceSJ;

@Controller
@RequestMapping("/aptitudeTestSJ")
public class AptitudeControllerTestSJ {
	
	//@Autowired
	//private AptitdeService service;
	
	@Autowired
	private AptitudeApiTestSJDAO dao;

	@Autowired
	private AptitudeServiceSJ service;
	
	//설문지 출력하기
	@RequestMapping("/itrstkAptitude")
	public String getAptitudeTestByNum(Model model, HttpServletRequest request) throws IOException {
		String qnum = request.getParameter("qnum");
		System.out.println(qnum);
	    model.addAttribute("RESULT", dao.getAptitudeTestByNum(qnum).getRESULT());
	    model.addAttribute("qnum", qnum);
	    
	    return "/aptitudeTestSJ/itrstkAptitude";
	}
	
	
	//크롤링 결과 집어넣기
	@RequestMapping("/report1")
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
		
		// 크롤링한 값을 dto에 set
		AptitudeTestValueDTOSJ dto = new AptitudeTestValueDTOSJ();
		dto = service.testCrawling(testURL, qnum);
		dto.setTest_num(Integer.parseInt(qnum));
		dto.setTest_answers(answers.toString());
		
		service.crawlingInsert(dto);
		
		List<String> reportResult = service.reportView(qnum, dto);
		model.addAttribute("reportResult", reportResult);
		
		List<String> updatedList1 = new ArrayList<>();
		List<String> updatedList2 = new ArrayList<>();
		List<String> updatedList3 = new ArrayList<>();
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
		}
		if (qnum.equals("25")) {
			// chart 값 추출		
			for(int i = 3; i <= 14; i++) {
				String element = reportResult.get(i);
				updatedList3.add(element);
			}
		
		}
		model.addAttribute("updatedList1", updatedList1);
		model.addAttribute("updatedList2", updatedList2);
		model.addAttribute("updatedList3", updatedList3);
		
		
		
		System.out.println(aptiTestResultResponse.getRESULT().getUrl());
		return "/aptitudeTestSJ/report";
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
    	service.temporarySaveInsert(answers, dto, qnum); // 임시 저장
    	
    	return "redirect:/aptitudeTestSJ/aptitudeMain?temporarySave=okSave";
	}
	
	
	
	
	//검사 횟수와 일자, 임시저장 값 꺼내기
	@RequestMapping("/aptitudeMain")
	public String aptitudeMain(Model model, AptitudeTestValueDTOSJ dto, HttpServletRequest request) throws IOException {
		
		List<AptitudeTestValueDTOSJ> dtoList = service.getRecentTest(dto);
		model.addAttribute("dtoList", dtoList);
		
		for(int i=0; i<4; i++) {
			System.out.println(dtoList.get(i).getTest_num());
			System.out.println(dtoList.get(i).getMax_test_date());
			System.out.println(dtoList.get(i).getCount());
		}
		
		
		String temporarySave = request.getParameter("temporarySave");
		model.addAttribute("temporarySave", temporarySave);
		
		
    	return "/aptitudeTestSJ/aptitudeMain";
	}
	
	
	@RequestMapping("/commonTest")
	public String commonTest(Model model, HttpServletRequest request) throws IOException {
		String qnum = request.getParameter("qnum");
	    model.addAttribute("qnum", qnum);
	    List<String> list = new ArrayList<>();
	    list.add("테스트1");
	    list.add("테스트2");
	    list.add("테스트3");
	    model.addAttribute("list", list);
	    
	    return "/aptitudeTestSJ/commonTest";
	}
}
