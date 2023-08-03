package whou.secproject.service;

import java.util.List; 

import whou.secproject.component.JobDicAptdValueListDTO;
import whou.secproject.component.JobDicDetailResponseDTO;
import whou.secproject.component.JobDicValueListDTO;
import whou.secproject.component.Job_unique_numDTO;	

public interface JobDicService {
	public List<JobDicValueListDTO> getSortValue(String tb_name);
	public List<JobDicAptdValueListDTO> getAptdValue(String tb_name);
	public List<Job_unique_numDTO> getJobNum(String tb_name);
	public void insert(JobDicDetailResponseDTO dto);
	public void insertJCC(int sort_value, String job_cds);
	public String getBackColor(int j_cd);
	public String getImg(int j_cd);
}
