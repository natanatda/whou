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
import whou.secproject.component.TestVoDTO;
import whou.secproject.repository.AptitudeApiDAO;
import whou.secproject.service.aptService;

@Controller
@RequestMapping("/aptitude")
public class AptitudeController {
	
	@Autowired
	private AptitudeApiDAO dao;
	
	@Autowired
	private aptService service;
	
	@RequestMapping("/testByNum")
	public String getAptitudeTestByNum(Model model, HttpServletRequest request) throws IOException {
		String qnum = request.getParameter("qnum");
	    model.addAttribute("RESULT", dao.getAptitudeTestByNum(qnum).getRESULT());
	    model.addAttribute("qnum", qnum);
	    
	    String pageResult ="/aptitude/itrstkAptitude";
	    if(qnum.equals("21") || qnum.equals("31")) {
	    	pageResult = "/aptitude/vocationAptitude";
	    }
	    
	    return pageResult;
	}
	
	@RequestMapping("/report")
    public String getAptitudeTestResult(String countQ, HttpServletRequest request, HttpServletResponse response,Model model) {
		System.out.println("d안대나용");
		List<String>answers = new ArrayList<>();
		String qnum = request.getParameter("qnum");
		model.addAttribute("qnum", qnum);
    	for(int i=1; i<=Integer.parseInt(countQ);i++) {
    		answers.add(request.getParameter("btnradio"+i));
    	}
		AptitudeTestResultResponseDTO aptiTestResultResponse = dao.getAptitudeTestResult(answers, qnum);
		System.out.println(aptiTestResultResponse.getRESULT().getUrl());
		String testURL = aptiTestResultResponse.getRESULT().getUrl();
		
		TestVoDTO dto = new TestVoDTO();
		dto = service.testCrawling(testURL, qnum);
		dto.setTest_num(Integer.parseInt(qnum));
		dto.setTest_answers(answers.toString());
		System.out.println("dto 잘되나 확인"+dto.getTest_answers());
		System.out.println("dto 잘되나 확인"+dto.getTest31_1());
		System.out.println("dto 잘되나 확인"+dto.getTest21_1());
		
		service.crawlingInsert(dto);
		model.addAttribute("percent",service.crawlingSplit(dto,qnum));
		model.addAttribute("rank",service.crawlingSplitRank(dto,qnum));
		model.addAttribute("job",service.crawlingSplitJob(dto,qnum));
		return "/aptitude/report";
    }

}
