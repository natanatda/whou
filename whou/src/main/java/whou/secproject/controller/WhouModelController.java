package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.WhouModelDTO;
import whou.secproject.service.WhouModelService;

@Controller
@RequestMapping("/whouModel/*")
public class WhouModelController {
	@Autowired
	private WhouModelService whouModelService;
	
	@RequestMapping("modelMain")
	public String viewKirby(Model model, HttpServletRequest request) {
		int num = 1;
		if(request.getParameter("name") != null) {			
			int select = Integer.parseInt(request.getParameter("name"));
			num = select;
		}
		
		WhouModelDTO dto = whouModelService.selectModel(num);
		
		if(dto.getColor() == null) {dto.setColor("no");}
		model.addAttribute("dto2",whouModelService.selectModel2());
		model.addAttribute("model",dto);
		return "/model/whouModel";
	}
	
}
