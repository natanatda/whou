package whou.secproject.controller;


import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.JobDicListResponseDTO;
import whou.secproject.component.JobDicParamDTO;
import whou.secproject.repository.JobDicApiDAO;

@Controller
@RequestMapping("/job")
public class JobController {
	
	
	@Autowired
	private JobDicApiDAO dao;
	
	@RequestMapping("/jobDicList")
	public String getjobDicListSort(Model model){
		JobDicParamDTO jParam = new JobDicParamDTO();
		jParam.setPageIndex("1");
		JobDicListResponseDTO dto = dao.getJobDicListSorted(jParam);
		int seq = dto.getJobs().get(0).getSeq();
		String name= dto.getJobs().get(0).getJob_nm();
		model.addAttribute("RESULT", dao.getJobDicListSorted(jParam));
		return "/sample/fq"; // ������ �����ϼ�
	}
	@RequestMapping("/job")
	public String getjobDicList(Model model){
		model.addAttribute("RESULT", dao.getJobDicDetail(150));
		return "/sample/fq"; // ������ �����ϼ�
	}
	
}
