package whou.secproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.AdminNoticeDTO;
import whou.secproject.service.AdminNoticeService;

@Controller
@RequestMapping("/cs/*")
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@RequestMapping("adminMain")
	public String adminMain(HttpSession session, Model model) {
		String email = (String)session.getAttribute("memId");
		if(email == null) { // 세션이 없으면 메인으로 이동
			return "redirect:/main";
		}
		int lv = adminNoticeService.noticeUserLvCheck(email); // 세션으로 회원 검사
		model.addAttribute("lv",lv);			
		
		return "/admin/main";
	}
	
	@RequestMapping("notice")
	public String noticeList(Model model, HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		int userCount = 0; // 세션이 null일떄 메서드 동작오류처리하기 위한 정수형 변수
		if(email != null) {userCount = 1;} // 세션이 null이 아닐 때 카운트 = 1 
		
		// 게시글 개수
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
	    int start = (currentPage - 1) * pageSize + 1;
	    int end = currentPage * pageSize;
	    int count = adminNoticeService.noticeCount();
	    
	    // 페이지 하단 처리
	    int number = count - (currentPage-1) * pageSize;
	    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){endPage = pageCount;}
		
		// 세션이 있을 때 레벨만 view로 보내줌
		if(userCount > 0) {model.addAttribute("lv", adminNoticeService.noticeUserLvCheck(email));}
		
		model.addAttribute("noticeList",adminNoticeService.noticeList(start, end));		
		model.addAttribute("count",count);
		model.addAttribute("number",number);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return "/admin/notice";
	}
	@RequestMapping("noticeDetail")
	public String noticeDetail(Model model, HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		int num = Integer.parseInt(request.getParameter("num"));
		
		if(email != null) {			
			model.addAttribute("lv",adminNoticeService.noticeUserLvCheck(email)); // 글 수정 버튼때문에 레벨 검사
		}
		
		adminNoticeService.noticeReadCount(num); // 글 번호로 조회수 +1
		model.addAttribute("notice",adminNoticeService.noticeDetail(num)); // 글 번호로 해당 게시글 보여줌
		return "/admin/noticeDetail";
	}
	
	@RequestMapping("noticeWriteForm")
	public String noticeWriteForm(HttpSession session, Model model) {
		String email = (String)session.getAttribute("memId");
		if(email == null) {
			return "redirect:/main";
		}
		int lv = adminNoticeService.noticeUserLvCheck(email); // 관리자 글 작성을 위한 레벨검사
		model.addAttribute("lv",lv);
		return "/admin/noticeWrite";
	}
	
	@RequestMapping("noticeWrite")
	public String noticeWrite(HttpSession session, AdminNoticeDTO dto) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {
			int lv = adminNoticeService.noticeUserLvCheck(email);
			if(lv == 0) {
				dto.setWriter(email); // 세션으로 작성자 입력
				adminNoticeService.noticeWrite(dto); // 글 작성
			}
		}
		return "redirect:/cs/notice";
	}
	@RequestMapping("noticeModify")
	public String noticeModify(AdminNoticeDTO dto, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {
			int lv = adminNoticeService.noticeUserLvCheck(email);
			if(lv == 0) {
				adminNoticeService.noticeModify(dto); // 글 수정
			}
		}
		return "redirect:/cs/notice";
	}
	@RequestMapping("noticeModifyForm")
	public String noticeModifyForm(Model model, HttpServletRequest request, HttpSession session) {		
		String email = (String)session.getAttribute("memId");
		if(email == null) {
			return "redirect:/main";
		}
		int num = Integer.parseInt(request.getParameter("num"));
		int lv = adminNoticeService.noticeUserLvCheck(email);
		
		model.addAttribute("notice",adminNoticeService.noticeDetail(num)); 
		model.addAttribute("lv",lv);

		return "/admin/noticeModifyForm";
	}
	
	@RequestMapping("noticeDelete")
	public String noticeDelete(HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {
			int lv = adminNoticeService.noticeUserLvCheck(email);
			if(lv == 0) {
				int num = Integer.parseInt(request.getParameter("num"));
				adminNoticeService.noticeDelete(num); // 삭제
			}
		}
		return "redirect:/cs/notice";
	}
	
	
	@RequestMapping("noticeSearch")
	public String noticeSearch(HttpServletRequest request) {
		String word = request.getParameter("word");
		String option = request.getParameter("sel");
		adminNoticeService.noticeSearch(option,word);
		return "/admin/notice";
	}
	
	
}
