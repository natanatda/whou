package whou.secproject.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import whou.secproject.component.AptitudeTestValueDTO;
import whou.secproject.service.AptitudeService;
import whou.secproject.service.MemberService;

@Controller
public class MainController {

	@Autowired
	private AptitudeService service;

	@RequestMapping("/main")
	public String main() {
	    return "/main"; 
	}
	
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		// user_info 테이블에서 세션에 해당하는 num 추출
		int userNum = service.userNumSelect(memId);
		
		// 적성 차트 점수
		String scoreA = service.getAptitudeScore(userNum);
		String [] scoreArr= scoreA.split("\\+");
		ObjectMapper objectMapper = new ObjectMapper();
        String scoresA = null;
		try {
			scoresA = objectMapper.writeValueAsString(scoreArr);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 적성 차트 이름
		String scoreName = service.getAptitudeScoreName(userNum);
		String [] scoreNameArr= scoreName.split("\\+");
		ObjectMapper objectMapperName = new ObjectMapper();
		String scoresName = null;
		try {
			scoresName = objectMapperName.writeValueAsString(scoreNameArr);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 흥미 차트 점수
		String scoreI = service.getInterestScore(userNum);
		String [] scoreArrI= scoreI.split("\\+");
		ObjectMapper objectMapperI = new ObjectMapper();
        String scoresI = null;
		try {
			scoresI = objectMapperI.writeValueAsString(scoreArrI);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 가치관 차트 점수
		String scoreV = service.getValuesScore(userNum);
		String [] scoreArrV= scoreV.split("\\+");
		ObjectMapper objectMapperV = new ObjectMapper();
        String scoresV = null;
		try {
			scoresV = objectMapperV.writeValueAsString(scoreArrV);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		model.addAttribute("interestScoreArr", scoresI);
		model.addAttribute("aptitudeScoreArr", scoresA);
		model.addAttribute("aptitudeNameArr", scoresName);
		model.addAttribute("valuesScoreArr", scoresV);
	    return "/user/mypage";
	}
}
