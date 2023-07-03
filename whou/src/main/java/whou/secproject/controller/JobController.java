package whou.secproject.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.JobDicParamDTO;
import whou.secproject.service.JobDicAPIService;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@Autowired
	private JobDicAPIService service;
	
	@RequestMapping("/jobDicList")
	public String getjobDicListSort(Model model){
		JobDicParamDTO jParam = new JobDicParamDTO();
		model.addAttribute("RESULT", service.getJobDicListSorted(jParam));
		return "/sample/fq"; // 예제임 수정하셈
	}
	@RequestMapping("/jobDicList")
	public String getjobDicList(Model model){
		model.addAttribute("RESULT", service.getJobDicDetail(150));
		return "/sample/fq"; // 예제임 수정하셈
	}
	
}
