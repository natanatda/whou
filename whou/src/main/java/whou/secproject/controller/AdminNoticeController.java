package whou.secproject.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import whou.secproject.component.AdminNoticeDTO;
import whou.secproject.component.SearchLogDTO;
import whou.secproject.service.AdminNoticeService;
import whou.secproject.service.JobSearchLogService;

@Controller
@RequestMapping("/cs/*")
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@Autowired
	private JobSearchLogService jobSearchLogService;
	
	// admin page
	@RequestMapping("admin")
	public String adminMain(HttpSession session, Model model, HttpServletRequest request) {
		// 세션이 없으면 메인으로 이동
		String email = (String)session.getAttribute("memId");
		if(email == null) { return "redirect:/main";}
		int lv = adminNoticeService.adminUserLvCheck(email); // 세션으로 회원 검사
		
		// 조회할 날짜
		String start = request.getParameter("startDate"); 
		String end = request.getParameter("endDate");
		String jobDateSelect = request.getParameter("jobDateSelect");
		String nowDate = LocalDate.now().toString(); // 오늘 날짜
		int rownum = 5;
		int jobCount = jobSearchLogService.isCountJob();
		int keyCount = jobSearchLogService.isCountKeyWord();
		
		List<SearchLogDTO> searchJobList = null;
		List<SearchLogDTO> searchKeyList = null;
		if(jobCount > 0) {
			searchJobList = jobSearchLogService.countJob(jobDateSelect,nowDate,start, end, rownum);
		}
		if(keyCount > 0) {
			searchKeyList = jobSearchLogService.countKeyWord(jobDateSelect,nowDate,start, end, rownum);
		}
		model.addAttribute("searchJobList", searchJobList);
		model.addAttribute("searchKeyList", searchKeyList);
		model.addAttribute("lv",lv);	
		model.addAttribute("now",nowDate);	
		model.addAttribute("startDate",start);	
		model.addAttribute("endDate",end);	
		
		return "/admin/admin";
	}
	@RequestMapping("searchDetail")
	public String searchDetail(Model model, HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email == null) { return "redirect:/main";}
		
		// 조회할 날짜
		String start = request.getParameter("startDate"); 
		String end = request.getParameter("endDate");
		String jobDateSelect = request.getParameter("jobDateSelect");
		String nowDate = LocalDate.now().toString(); // 오늘 날짜
		
		int lv = adminNoticeService.adminUserLvCheck(email); // 세션으로 회원 검사
		String rownumString = request.getParameter("rownum");
		if(rownumString == null) {rownumString = "5";}
		int rownum = Integer.parseInt(rownumString);
		
		int jobCount = jobSearchLogService.isCountJob();
		int keyCount = jobSearchLogService.isCountKeyWord();
		
		List<SearchLogDTO> searchJobList = null;
		List<SearchLogDTO> searchKeyList = null;
		
		if(jobCount > 0) {
			searchJobList = jobSearchLogService.countJob(jobDateSelect,nowDate,start, end, rownum);
		}
		if(keyCount > 0) {
			searchKeyList = jobSearchLogService.countKeyWord(jobDateSelect,nowDate,start, end, rownum);
		}
		
		model.addAttribute("searchJobList", searchJobList);
		model.addAttribute("searchKeyList", searchKeyList);
		model.addAttribute("rownum",rownum);	
		model.addAttribute("lv",lv);		
		model.addAttribute("jobDateSelect",jobDateSelect);	
		model.addAttribute("now",nowDate);	
		model.addAttribute("startDate",start);	
		model.addAttribute("endDate",end);	
		
		return "/admin/searchDetail";
	} // admin page end
	
	@RequestMapping("notice")
	public String noticeList(Model model, HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		String word = request.getParameter("word");
		String option = request.getParameter("option");
		int count = 0; // DB 안에 있는 게시글 개수
		
		// 출력 게시글 개수지정
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
	    int start = (currentPage - 1) * pageSize + 1;
	    int end = currentPage * pageSize;
	    
	    if(word == null && option == null) { 
	    	count = adminNoticeService.noticeCount();
	    	model.addAttribute("noticeList",adminNoticeService.noticeList(start, end)); // 검색 안 했을 때 리스트		
	    }else if (word != null && option != null){ 
	    	Map<String, Object> noticeSearch = new HashMap<>(); 
			noticeSearch.put("option", option); // 파라미터들 map으로 보내기 위해서 대입
			noticeSearch.put("word", word);
			noticeSearch.put("start", start);
			noticeSearch.put("end", end);
			count = adminNoticeService.noticeSearch(noticeSearch).size();
			model.addAttribute("noticeList",adminNoticeService.noticeSearch(noticeSearch)); // 검색 했을 때 리스트
			model.addAttribute("word", word);
			model.addAttribute("option", option);
	    }else { 
	    	return "redirect:/cs/notice"; // 파라미터 1개라도 null이면 공지사항으로 이동
	    }
	    
	    // 페이지 하단 처리
	    int number = count - (currentPage-1) * pageSize;
	    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){endPage = pageCount;}
		
		// 세션이 있을 때만 레벨을 view로 보내줌
		if(email != null) {model.addAttribute("lv", adminNoticeService.adminUserLvCheck(email));}
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("count",count);
		model.addAttribute("number",number);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		return "/admin/notice";
	}
	@RequestMapping("noticeDetail")
	public String noticeDetail(Model model, HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		int num = Integer.parseInt(request.getParameter("num"));
		
		if(email != null) {			
			model.addAttribute("lv",adminNoticeService.adminUserLvCheck(email)); // 글 수정 버튼때문에 레벨 검사
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
		int lv = adminNoticeService.adminUserLvCheck(email); // 관리자 글 작성을 위한 레벨검사
		model.addAttribute("lv",lv);
		return "/admin/noticeWrite";
	}
	
	@RequestMapping("noticeWrite")
	public String noticeWrite(HttpSession session, AdminNoticeDTO dto) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {
			int lv = adminNoticeService.adminUserLvCheck(email);
			if(lv == 2) {
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
			int lv = adminNoticeService.adminUserLvCheck(email);
			if(lv == 2) {
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
		int lv = adminNoticeService.adminUserLvCheck(email);
		
		model.addAttribute("notice",adminNoticeService.noticeDetail(num)); 
		model.addAttribute("lv",lv);

		return "/admin/noticeModifyForm";
	}
	
	@RequestMapping("noticeDelete")
	public String noticeDelete(HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {
			int lv = adminNoticeService.adminUserLvCheck(email);
			if(lv == 2) {
				int num = Integer.parseInt(request.getParameter("num"));
				adminNoticeService.noticeDelete(num); // 삭제
			}
		}
		return "redirect:/cs/notice";
	}	
}
