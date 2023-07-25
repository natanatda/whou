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
import whou.secproject.service.WhouModelCustomService;

@Controller
public class MainController {

	@Autowired
	private AptitudeService service;
	
	@Autowired
	private WhouModelCustomService whouModelCustomService;
	
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
		}
	    return "/main"; 
	}
	

}
