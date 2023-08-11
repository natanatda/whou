package whou.secproject.service;

import java.math.BigDecimal; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import whou.secproject.component.CertiDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.SelectDTO;


public interface RecommendService {
	public RecommandInfoDTO getTestResult(int num);
	public List<Integer> allJobCd(String tb_name);
	public List<String> getValueCd(String tb_name);
	public ArrayList<String> majorInfo(CertiDTO certi);
	public List<Integer> majorToCD(SelectDTO selDTO, String certi);
	public void createJobPoint(int num, int major, int certi);
	public void insertJobPoint(int num, int job_cd, double total, double [] detail, int major, int certi);
	public List<HashMap<String, BigDecimal>> getJobPoint(SelectDTO selDTO,int user, int page, int count,String col);
	public List<HashMap<String, BigDecimal>> getJobPointNM(SelectDTO selDTO,int user, int page, int count,String col);
	public HashMap<String, String> getRecoList(SelectDTO selDTO, int user);
	public void dropTable(int num);
	public String getJname(SelectDTO selDTO, int job_cd);
	public int tbTrue(int user);
	public int updateTrue(int user);
	public ArrayList<Integer> getImportances(int user);
	public void setImportances(int user,String [] arr);
	public void insertConsult(int user,int job_cd) ;
	public List<HashMap<String, Object>> getJob_NM(String job_nm);
	public List<HashMap<String, String>> getJobDetail(int job_cd);
	public HashMap<String, String> getJobFactor(int job_cd);

	public HashMap<String,String> getJobTagByTal(String tals);
	public List<Integer> getJobLi(String tals);
	public List<Integer> getInteLi(String tals);

}
