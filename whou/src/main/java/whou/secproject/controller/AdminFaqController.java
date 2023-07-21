package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import whou.secproject.component.AdminFaqDTO;
import whou.secproject.service.AdminFaqService;

@Controller
@RequestMapping("/cs/*")
public class AdminFaqController {
	
	@Autowired
	private AdminFaqService adminFaqService;
	
	@RequestMapping("faq")
	public String faqList(Model model, HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		String category = request.getParameter("category");
		
		if(email != null) { // 작성 버튼때문에 레벨 검사
			model.addAttribute("lv",adminFaqService.adminUserLvCheck(email));
		}
		
		if(category == null) { // 카테고리별 검색
			model.addAttribute("faqList",adminFaqService.faqList()); 
		}else {
			model.addAttribute("faqList",adminFaqService.faqCategory(category));
		}
		return "/admin/faq";
	}
	@RequestMapping("faqDelete")
	public String faqDelete(HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {			
			int lv = adminFaqService.adminUserLvCheck(email);
			if(lv == 2) { // 관리자 일때만
				int num = Integer.parseInt(request.getParameter("num"));
				adminFaqService.faqDelete(num); // 삭제
			}
		}
		return "redirect:/cs/faq";
	}
	@RequestMapping("faqWriteForm")
	public String faqWriteForm(Model model, HttpSession session) {
		if((String)session.getAttribute("memId") == null) { // 세션이 없으면 메인으로 이동
			return "redirect:/main";
		}		
		String email = (String)session.getAttribute("memId");
		int lv = adminFaqService.adminUserLvCheck(email);
		model.addAttribute("lv",lv);
		return "/admin/faqWriteForm";
	}
	@RequestMapping("faqWrite")
	public String faqWrite(AdminFaqDTO dto, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null ) {			
			int lv = adminFaqService.adminUserLvCheck(email);
			if(lv == 2) {
				adminFaqService.faqWrite(dto); // faq 작성
			}
		}
		return "redirect:/cs/faq";
	}
	
	@RequestMapping("faqReadCount")
	public @ResponseBody String faqReadCount(int num) {
		adminFaqService.faqReadCount(num); // 조회수 +1
		return "";
	}
}
