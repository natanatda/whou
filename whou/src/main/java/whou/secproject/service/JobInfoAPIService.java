package whou.secproject.service;

import whou.secproject.component.JobDicDetailResponseDTO;
import whou.secproject.component.JobInfoListResponseDTO;
import whou.secproject.component.JobTypeListResponseDTO;

public interface JobInfoAPIService {
	public JobInfoListResponseDTO getJobInfoListSorted(String q);
	public JobDicDetailResponseDTO getJobInfoDetail(String q);
	public JobTypeListResponseDTO getJobTypeList();

}
