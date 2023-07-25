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


@Controller
public class MainController {
	
	@Autowired
	private MainService service;

	@RequestMapping("/main")
	public String main(Model model) {
		int code = 165;
		String icon = service.selectIcon(code);
		model.addAttribute("icon", icon);
	    return "/main"; 
	}
	

}
