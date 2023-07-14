package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.Kirby_Job_CustomDTO;
import whou.secproject.service.Kirby_Job_CustomService;

@Controller
@RequestMapping("/kirby/*")
public class Kirby_Job_CustomController {
	@Autowired
	private Kirby_Job_CustomService service;
	
	@RequestMapping("main")
	public String viewKirby(Model model, HttpServletRequest request) {
		int num = 1;
		if(request.getParameter("name") != null) {			
			int select = Integer.parseInt(request.getParameter("name"));
			num = select;
		}
		
		Kirby_Job_CustomDTO dto = service.selectKirby(num);
		
		if(dto.getColor() == null) {dto.setColor("no");}
		model.addAttribute("dto2",service.selectKirby2());
		model.addAttribute("kirby",dto);
		return "/kirby/kirbyAll";
	}
	
}
