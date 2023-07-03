package whou.secproject.service;

import whou.secproject.component.JobDicListResponseDTO;
import whou.secproject.component.JobDicParamDTO;

public interface JobDicAPIService {
	public JobDicListResponseDTO getJobDicListSorted(JobDicParamDTO jParam);  
	public JobDicListResponseDTO getJobDicDetail(int seq);
}
