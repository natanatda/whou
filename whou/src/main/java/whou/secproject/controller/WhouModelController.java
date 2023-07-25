package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import whou.secproject.component.WhouModelCustomDTO;
import whou.secproject.component.WhouModelDTO;
import whou.secproject.service.WhouModelCustomService;
import whou.secproject.service.WhouModelService;

@Controller
@RequestMapping("/whouModel/*")
public class WhouModelController {
	@Autowired
	private WhouModelService whouModelService;
	
	@Autowired
	private WhouModelCustomService whouModelCustomService;
	
	// 직업분류별 아바타 -- 
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
	}// -- 직업분류별 아바타 end
	
	// model custom
	@RequestMapping("inputText")
	public @ResponseBody String inputText(HttpServletRequest request) {
		String color = request.getParameter("selectedColor");
		return color;
	}
	
	@RequestMapping("modelCustom")
	public String modelCustom(Model model, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email == null) {return "redirect:/main";}
		
		int count = whouModelCustomService.customCount(email);
		if(count != 0) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
		}
		model.addAttribute("count", count);
		return "/model/modelCustom";
	}
	@RequestMapping("modelCustomInsert")
	public String modelCustomInsert(Model model, HttpSession session, WhouModelCustomDTO dto,HttpServletRequest request) {
		String email = (String)session.getAttribute("memId");
		if(email == null) {return "redirect:/main";}
		
		dto.setEmail(email);
		dto.setHeadColor(request.getParameter("head"));
		dto.setArmColor(request.getParameter("arm"));
		dto.setCheekColor(request.getParameter("cheek"));
		dto.setLegColor(request.getParameter("leg"));
		int count = whouModelCustomService.customCount(email);
		if(count == 0) {
			whouModelCustomService.customInsert(dto);			
		}else {
			whouModelCustomService.customUpdate(dto);
		}		
		return "redirect:/whouModel/modelCustom";
	}
	@RequestMapping("modelCustomDelete")
	public String modelCustomDelete(Model model, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email == null) {return "redirect:/whou/main";}
		whouModelCustomService.customDelete(email);
		return "redirect:/whouModel/modelCustom";
	}
	// model custom end
}
