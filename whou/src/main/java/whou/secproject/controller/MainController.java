package whou.secproject.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.AssistantDTO;
import whou.secproject.component.SelectDTO;
import whou.secproject.component.WhouModelDTO;
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
		
		Integer level = (Integer)session.getAttribute("level");
		if(level != null) {			
			model.addAttribute("level",level);
		}
		// ai model 가져오기
		int userNum = 0;
		int sortValue = 995; // 조건문 해당 안 되면 붓 들게 하기
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
        	if(cunsultingNum != null) {
        		// 모델 무기(?)
            	sortValue = whouModelService.selectSortValue(cunsultingNum); // 컨설팅 직업번호로 검색
    			if(sortValue == 0) { // 머리 위에 가방 대신 손에가방 들게 함
    				sortValue = 994;
    			}
        	}
        	else cunsultingNum = 0;
        }		
        
		String icon = service.selectIcon(cunsultingNum);
		if(icon==null) icon="fa-solid fa-user";
		
		WhouModelDTO whouModel = whouModelService.selectModel(sortValue);
		if(whouModel.getColor() == null) {whouModel.setColor("noColor");} // 무기에 색 없으면 noColor 대입  
		
		model.addAttribute("icon", icon);
		model.addAttribute("modelItem", whouModel); // 붓 장착
		
		
		// 추천 글 가져오기
        HashMap<String,String> talent = serviceRe.getJobFactor(cunsultingNum);
        String message = "당신은 어떤 능력을 가지고 있나요?";
        if(talent!=null) {
        	String talStr = talent.get("DETAIL_VALUE");
    		if(talStr.equals("자기성찰능력")) talStr = "자아성찰능력";
    		message= service.selectRecoMessage(talStr);
        }
        model.addAttribute("message", message);
        
        
        //
        List<HashMap<String,Object>> result = null;
        if(email!=null) {
        	if(serviceRe.tbTrue(userNum)==1) {
        		SelectDTO selDTO = new SelectDTO();
        		selDTO.setOrder(" order by total desc , job_cd asc");
        		List<HashMap<String, BigDecimal>> recoLi= serviceRe.getJobPoint(selDTO, userNum, 1, 3,"*");
        		result = new ArrayList<HashMap<String,Object>>();
        		for(int j = 0 ; j < 3; j++) {
        			HashMap<String,Object> recoMap= new HashMap<String,Object>();
        			int j_cd = recoLi.get(j).get("JOB_CD").intValue();
        			List<HashMap<String,String>> info = serviceRe.getJobDetail(j_cd);
        			String j_nm = serviceRe.getJname(new SelectDTO(), j_cd);
        			recoMap.put("J_NM", j_nm);
        			StringTokenizer st = new StringTokenizer(info.get(0).get("WORKS"),"/");
        			String work = st.nextToken();
        			recoMap.put("work", work);
        			ArrayList<HashMap<String,String>> arr = new ArrayList<HashMap<String,String>>();
        			for(int i = 1; i < info.size(); i++) {
        				talent = info.get(i);
        				arr.add(talent);
        				arr.add(serviceRe.getJobTagByTal(talent.get("DETAIL_VALUE")));
        			}
        			recoMap.put("talents", arr);
        			result.add(recoMap);
        		}
        	}
    	}
        model.addAttribute("recoLi3", result);
        model.addAttribute("memId", email);
	    return "/main"; 
	}
	
	
	@RequestMapping("/loading")
	public String loading(Model model, HttpSession session) {
		String email = (String)session.getAttribute("memId");
		// ai model 가져오기
		int userNum = 0;
		if(email != null) {
			model.addAttribute("model", whouModelCustomService.customModel(email));
			userNum=serviceAt.userNumSelect(email);
		}
		int brush = 995;
		model.addAttribute("brush", whouModelService.selectModel(brush)); // 붓 장착
	return "/load";
	}
	
	@RequestMapping("/index")
	public String index() {

	return "/index";
	}
	
	@RequestMapping("/index2")
	public String index2() {

	return "/index2";
	}
	
	@RequestMapping("/index3")
	public String index3() {

	return "/index3";
	}
	
	@RequestMapping("/indexMain")
	public String indexMain() {

	return "/indexMain";
	}

}
