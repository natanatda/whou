package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
}
