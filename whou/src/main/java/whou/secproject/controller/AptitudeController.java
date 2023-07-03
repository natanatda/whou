package whou.secproject.controller;

import java.io.IOException; 

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.AptitudeTestResultResponseDTO;
import whou.secproject.service.AptdAPIService;

@Controller
@RequestMapping("/aptitude")
public class AptitudeController {
	
	@Autowired
	private AptdAPIService service;
	
	@RequestMapping("/testByNum")
	public String getAptitudeTestByNum(Model model, HttpServletRequest request) throws IOException {
		
		String q = request.getParameter("num");
	    model.addAttribute("RESULT", service.getAptitudeTestByNum(q).getRESULT());
	    
	    return "/sample/fq"; // 예제임 수정하셈
	}
	
	@RequestMapping("/testResult")
    public String getAptitudeTestResult() {
		String [] answers = new String[1];
		String q = "20";
		AptitudeTestResultResponseDTO aptiTestResultResponse = service.getAptitudeTestResult(answers, q);
		return aptiTestResultResponse.getRESULT().getUrl();
    }
}
