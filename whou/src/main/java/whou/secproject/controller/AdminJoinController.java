package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import whou.secproject.component.MemberDTO;
import whou.secproject.service.AdminNoticeService;
import whou.secproject.service.MemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminJoinController {
	
	@Autowired
	private MemberService memservice;
	
	@RequestMapping("adminJoin")
	public String admiinJoinForm(HttpSession session) {
		String memId =(String)session.getAttribute("memId");
		if(!memId.equals("tmdgnsdl1534@naver.com")) { // 아이디가 최초 관리자가 아니면 리다이렉트
			return "redirect:/member/joinForm";
		}
		return "/admin/adminJoinForm";
	}
	
	@RequestMapping("adminPro")
	public @ResponseBody int admiinJoinPro(MemberDTO dto, HttpSession session) {
		int check = memservice.check(dto.getEmail()); // 중복 아이디 체크
		if(check == 0) { // 중복이 아니면 0
			memservice.adminInsert(dto); // 회원가입
		}
		return check;
	}
	
	@RequestMapping("adminList")
	public String admiinList(HttpSession session, Model model, HttpServletRequest request) {
		String memId = (String)session.getAttribute("memId");
		if(!memId.equals("tmdgnsdl1534@naver.com")) { return "redirect:/cs/admin";} // 아이디가 최초 관리자가 아니면 리다이렉트
		
		model.addAttribute("pw", request.getParameter("pw")); // 관리자 리스트
		model.addAttribute("adminList", memservice.getAdmin()); // 관리자 리스트
		return "/admin/adminList";
	}
	
	@RequestMapping("adminDelete")
	public String admiinDelete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memId =(String)session.getAttribute("memId"); // 세션검사
		
		String email = request.getParameter("email");
		
		if(!memId.equals("tmdgnsdl1534@naver.com")) { // 아이디가 최초 관리자가 아니면 리다이렉트
			return "redirect:/member/joinForm";
		}
		memservice.deleteAdmin(email);
		return "redirect:/admin/adminList";
	}
}
