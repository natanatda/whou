package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.service.MemberService;

@Controller
public class MainController {

	@Autowired
	

	@RequestMapping("/main")
	public String main() {

	    return "/main"; 
	}
}
