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

import whou.secproject.service.AptitudeService;
import whou.secproject.service.MainService;
import whou.secproject.service.WhouModelCustomService;


@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@Autowired
	private WhouModelCustomService whouModelCustomService;

	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		// ai model 가져오기
		if(email != null) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
		}
		
		// icon 가져오기
		int code = 165;
		String icon = service.selectIcon(code);
		model.addAttribute("icon", icon);
	    return "/main"; 
	}
	

}
