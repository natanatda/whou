package whou.secproject.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.SelectDTO;

public interface RecommendMapper {
	
	public RecommandInfoDTO getTestResult(int num);
	public List<Integer> allJobCd(String tb_name);
	public List<String> getValueCd(String tb_name);
	public <T extends SelectDTO> HashMap selectInfo(T selDTO);
	public void createJobPoint(@Param("num")int num, @Param("majors")ArrayList<String> majors, @Param("certis")ArrayList<String> certi);
	public void insertJobPoint(@Param("num")int num, @Param("job_cd") int job_cd, 
			@Param("total") double total, @Param("aptitude1")double aptitude1,
			@Param("aptitude2")double aptitude2, @Param("aptitude3")double aptitude3,
			@Param("interest1")double interest1, @Param("interest2")double interest2,
			@Param("interest3")double interest3, @Param("value1")double value1,
			@Param("value2")double value2,@Param("value3")double value3,
			@Param("value4")double value4, @Param("majors")ArrayList<Double> majors,
			@Param("certis")ArrayList<Double> certi);
	public void dropTable(int num);
	public void updateFalse(int num);
	public void insertConsult(@Param("user")int user,@Param("job_cd") int job_cd);
	//public LinkedHashMap<Integer,String> getJob_NM(String job_nm);
	public void setImportances(@Param("user")int user,@Param("impt")String impt);
	public List<Integer> getJobLi(String tals);

}
