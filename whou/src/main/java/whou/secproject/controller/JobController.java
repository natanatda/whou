package whou.secproject.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.repository.JobApiDAO;

@Controller
@RequestMapping("/job")
public class JobController {
	
	//@Autowired
	//private AptitdeService service;
	
	@Autowired
	private JobApiDAO dao;
	
	@RequestMapping("/jobListInfo")
	public String getjobListInfo(Model model, HttpServletRequest request) {
		
		String q = request.getParameter("num");
	    model.addAttribute("RESULT", dao.getJobInfoListSorted(q) );
	    
	    return "/sample/fq"; // 예제임 수정하셈
	}
	@RequestMapping("/jobDetailInfo")
	public String getjobDetailInfo(Model model, HttpServletRequest request) {
		
		String q = request.getParameter("num");
		model.addAttribute("RESULT", dao.getJobInfoDetail(q) );
		
		return "/sample/fq"; // 예제임 수정하셈
	}
	@RequestMapping("/jobTypeList")
	public String getjobTypeList(Model model){
		model.addAttribute("RESULT", dao.getJobTypeList());
		return "/sample/fq"; // 예제임 수정하셈
	}
	
}
