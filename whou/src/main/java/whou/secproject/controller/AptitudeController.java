package whou.secproject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.AptitudeTestResultResponseDTO;
import whou.secproject.repository.AptitudeApiDAO;

@Controller
@RequestMapping("/aptitude")
public class AptitudeController {
	
	private final WebDriver webDriver;
	
	@Autowired
	private AptitudeApiDAO dao;
	
	 @Autowired
	    public AptitudeController(WebDriver webDriver) {
	        this.webDriver = webDriver;
	    }
	
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
	
	@RequestMapping("conn2")
	public String conn2(Model model) throws REXPMismatchException {
		webDriver.get("https://www.career.go.kr/inspct/web/psycho/vocation/report?seq=NjMzOTIwODQ");

	    // 적성검사
        WebElement testElement = webDriver.findElement(By.cssSelector("#ct > div.aptitude_result_wrap > div.aptitude-result-content > div.cont-wrap.page-break > ul > li > strong"));
        String testAll = testElement.getText();
        model.addAttribute("testAll", testAll);

        // 백분위
        WebElement percentElement = webDriver.findElement(By.cssSelector("#ct > div.aptitude_result_wrap > div.aptitude-result-content > div.cont-wrap.page-break > div:nth-child(5) > table > tbody > tr > td:nth-child(even)"));
        String testPercent = percentElement.getText();
        model.addAttribute("testPercent", testPercent);

        // 직업추천
        WebElement rcmElement = webDriver.findElement(By.cssSelector("#ct > div.aptitude_result_wrap > div.aptitude-result-content > div.cont-wrap.page-break > div:nth-child(7) > table > tbody > tr > th"));
        String testRcm = rcmElement.getText();
        model.addAttribute("testRcm", testRcm);

        webDriver.navigate().to("https://www.career.go.kr/inspct/web/psycho/itrstk/report?seq=NjMzOTM3NDE");

        // 흥미검사
        WebElement testElement1 = webDriver.findElement(By.cssSelector("#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(1) > ul > li > span"));
        String testAll1 = testElement1.getText();
        model.addAttribute("testAll1", testAll1);

        // 백분위
        WebElement percentElement1 = webDriver.findElement(By.cssSelector("#ct > div:nth-child(2) > div > div > div > table > tbody > tr > td > div > div.scoreBar > span"));
        String testPercent1 = percentElement1.getText();
        model.addAttribute("testPercent1", testPercent1);

        // 직업추천
        WebElement rcmElement1 = webDriver.findElement(By.cssSelector("#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(2) > div > table > thead > tr > th"));
        String testRcm1 = rcmElement1.getText();
        model.addAttribute("testRcm1", testRcm1);

        webDriver.quit();
        
	      return "/aptitude/report";
	   }
}
