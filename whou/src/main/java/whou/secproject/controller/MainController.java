package whou.secproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.service.MainService;
import whou.secproject.service.WhouModelCustomService;
import whou.secproject.service.WhouModelService;


@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@Autowired
	private WhouModelCustomService whouModelCustomService;
	
	@Autowired
	private WhouModelService whouModelService;

	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		
		String email = (String)session.getAttribute("memId");
		// ai model 가져오기
		if(email != null) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
		}
		
		// icon 가져오기
		int code = 165;
		int brush = 995;
		String icon = service.selectIcon(code);
		model.addAttribute("icon", icon);
		model.addAttribute("brush", whouModelService.selectModel(brush)); // 붓 장착
	    return "/main"; 
	}
	

}
