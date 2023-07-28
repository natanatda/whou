package whou.secproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import whou.secproject.component.AssistantDTO;
import whou.secproject.service.AssistantService;


@Controller
@RequestMapping("/assistant/*")
public class AssistantController {
	
	@Autowired
	private AssistantService assistantService;
	
	@RequestMapping("ai")
	public String viewAi(Model model, HttpServletRequest request,HttpSession session) {
		int count = assistantService.assistantCount();
		if(count > 0) {
			// 레벨 그룹 1(첫 번째 질문인 리스트)
			List<AssistantDTO> aiList = assistantService.assistantRef_level1();
			session.setAttribute("assistantList", aiList);
			model.addAttribute("assistantList",aiList);
		}
		return "/assistant/ai";
	}

	
	@RequestMapping("aiList")
	public String aiList(Model model, HttpSession session) {
		String email = (String)session.getAttribute("memId"); // 회원 세션 검사
		if(email == null) { 
			return "redirect:/main"; // 세션이 없으면 메인으로 이동
		}
		int lv = assistantService.adminUserLvCheck(email); // 세션으로 레벨만 검색
		int count = assistantService.assistantCount(); // 모든 챗봇 리스트 개수 세기
		if(count > 0) { // 챗봇이 있으면 리스트를 view로 보냄 (null방지)
			model.addAttribute("list",assistantService.assistantList());
		}
		model.addAttribute("lv", lv);
		model.addAttribute("count",count);
		return "/assistant/aiList";
	}
	
	@RequestMapping("aiUpdate")
	public String aiUpdate(AssistantDTO dto, HttpSession session,HttpServletRequest request) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {			
			int lv = assistantService.adminUserLvCheck(email);
			if(lv == 2) { // 레벨 2 => 관리자
				assistantService.assistantUpdateList(dto); // 리스트 수정			
			}
		}
		return "redirect:/assistant/aiList";
	}
	@RequestMapping("aiDelete")
	public String aiDelete(HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {			
			int lv = assistantService.adminUserLvCheck(email);
			int num = Integer.parseInt(request.getParameter("num"));
			if(lv == 2) {
				assistantService.assistantDelete(num); // 리스트 삭제			
			}
		}
		return "redirect:/assistant/aiList";
	}
	
	@RequestMapping("aiInsert")
	public String aiInsert(AssistantDTO dto, HttpServletRequest request, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		if(email != null) {
			int ref = Integer.parseInt(request.getParameter("ref"));
			int ref_level = Integer.parseInt(request.getParameter("ref_level"));
			int lv = assistantService.adminUserLvCheck(email);
			
			dto.setRef(ref);
			dto.setRef_level(ref_level);
			
			if(lv == 2) {
	 			assistantService.assistantInsertList(dto); // 챗봇 입력			
			}
		}
		return "redirect:/assistant/aiList";
	}
	
										// produces => ajax 한글 인코딩
	@RequestMapping(value = "aiContent", produces = "application/text; charset=utf8")
	public @ResponseBody String aiContent(HttpServletRequest request) {
		String qes = request.getParameter("prompt");
		String content = assistantService.assistantSelectCon(qes); // 입력받은 질문으로 답변 출력
				
		return content;
	}
	@RequestMapping("getAiList")
	public @ResponseBody List<AssistantDTO> getAiList(HttpServletRequest request) {
		String qes = request.getParameter("prompt");
		int ref = assistantService.assistantRef(qes); // 질문의 그룹 검색
		List<AssistantDTO> list = assistantService.assistantSelectLevel(ref); // 해당 그룹 리스트 반환
		return list;
	}
}
