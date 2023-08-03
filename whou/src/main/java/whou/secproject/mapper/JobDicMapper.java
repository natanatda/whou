package whou.secproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.JobCreateDTO;
import whou.secproject.component.JobDicAptdValueListDTO;
import whou.secproject.component.JobDicValueListDTO;
import whou.secproject.component.JobInsertDTO;
import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.Job_unique_numDTO;


public interface JobDicMapper {
	public List<JobDicValueListDTO> getSortValue(String tb_name);
	public List<JobDicAptdValueListDTO> getAptdValue(String tb_name);
	public List<Job_unique_numDTO> getJobNum(String tb_name);
	public void insertJI(Job_infoDTO dto);
	public void createMapList(JobCreateDTO jcdto);
	public void createJP(@Param("num") int num, @Param("tb_name") String tb_name);
	public void insertJR(JobInsertDTO dto);
	public void insertJP(JobInsertDTO dto);
	public void insertJD(JobInsertDTO dto);
	public void insertJCC(@Param("sort_value") int sort_value, @Param("job_cds") String job_cds);
	public List<String> getBackColor(int j_cd);
	public String getImg(int j_cd);
}
