package whou.secproject.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.AssistantDTO;
import whou.secproject.component.SelectDTO;
import whou.secproject.service.AptitudeService;
import whou.secproject.service.AssistantService;
import whou.secproject.service.MainService;
import whou.secproject.service.MemberService;
import whou.secproject.service.RecommendService;
import whou.secproject.service.WhouModelCustomService;
import whou.secproject.service.WhouModelService;


@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@Autowired
	private WhouModelCustomService whouModelCustomService;
	
	@Autowired
	private AptitudeService serviceAt;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private RecommendService serviceRe;
	
	@Autowired
	private WhouModelService whouModelService;
	
	@Autowired
	private AssistantService assistantService;

	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		
		String email = (String)session.getAttribute("memId");
		// ai model 가져오기
		int userNum = 0;
		if(email != null) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
			userNum=serviceAt.userNumSelect(email);
		}
		
		int count = assistantService.assistantCount(); // null방지 카운트
		if(count > 0) {
			List<AssistantDTO> aiList = assistantService.assistantRef_level1();	// 레벨 그룹 1(첫 번째 질문인 리스트)
			session.setAttribute("assistantList", aiList);
		}
		// icon 가져오기
		Integer cunsultingNum = 0;
        if(email!= null) {
        	cunsultingNum = memService.getCunsultingNum(userNum);
        	if(cunsultingNum==null)cunsultingNum = 0;
        }		
        int brush = 995;
		String icon = service.selectIcon(cunsultingNum);
		model.addAttribute("icon", icon);
		model.addAttribute("brush", whouModelService.selectModel(brush)); // 붓 장착
		
		
		// 추천 글 가져오기
		
        HashMap<String,String> talent = serviceRe.getJobFactor(cunsultingNum);
        String message = null;
        if(talent!=null) {
        	String talStr = talent.get("DETAIL_VALUE");
    		if(talStr.equals("자기성찰능력")) talStr = "자아성찰능력";
    		message= service.selectRecoMessage(talStr);
        }
        model.addAttribute("message", message);
        
        
        //
        if(email!=null) {
           // List<HashMap<String, BigDecimal>> recoLi= serviceRe.getJobPoint(new SelectDTO(), userNum, 1, 5);
        }
	    return "/main"; 
	}
}
