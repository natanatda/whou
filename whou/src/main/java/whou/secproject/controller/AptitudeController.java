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
import whou.secproject.repository.AptitudeApiDAO;

@Controller
@RequestMapping("/aptitude")
public class AptitudeController {
	
	
	@Autowired
	private AptitudeApiDAO dao;
	
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
    public String getAptitudeTestResult(String countQ, HttpServletRequest request, HttpServletResponse response) {
		List<String>answers = new ArrayList<>();
    	for(int i=1; i<=Integer.parseInt(countQ);i++) {
    		answers.add(request.getParameter("btnradio"+i));
    	}
		String qnum = request.getParameter("qnum");
		AptitudeTestResultResponseDTO aptiTestResultResponse = dao.getAptitudeTestResult(answers, qnum);
		System.out.println(aptiTestResultResponse.getRESULT().getUrl());
		return "/aptitude/report";
    }
}
