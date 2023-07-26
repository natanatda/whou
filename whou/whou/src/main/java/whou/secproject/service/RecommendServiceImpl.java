package whou.secproject.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.CertiDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.SelectDTO;
import whou.secproject.handler.SelectResultHandler;
import whou.secproject.mapper.RecommendMapper;

@Service
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private RecommendMapper mapper;

	@Autowired
	private SqlSessionFactory sqlSessionFactory;


	@Override
	public RecommandInfoDTO getTestResult(int num) {
		return mapper.getTestResult(num);
	}
	@Override
	public List<Integer> allJobCd(String tb_name) {
		return mapper.allJobCd(tb_name);
	}
	@Override
	public List<String> getValueCd(String tb_name) {
		return mapper.getValueCd(tb_name);
	}
	@Override
	public ArrayList<String> majorInfo(CertiDTO certi) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		certi.setFullClassName("String");
		//certi.setCol("school_major");
		certi.setTb_name("user_info");
		certi.setConditions(Arrays.asList("num=#{num}"));
	    sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", certi, resultHandler);
		sqlSession.close();
	    HashMap<String,String> map = resultHandler.getSelOne();
	    String certis = null;
	    if(map!=null) certis = map.get(certi.getCol());
	    ArrayList<String> tokens = null;
	    if(certis!=null) {
	    	tokens = new ArrayList<String>();
	    	StringTokenizer st = new StringTokenizer(certis,",");
	    	while(st.hasMoreTokens()) tokens.add(st.nextToken());
	    }
	    return tokens;
		
	}
	public List<Integer> majorToCD(SelectDTO selDTO, String certi){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<BigDecimal> resultHandler = new SelectResultHandler<BigDecimal>();
		selDTO.setFullClassName("BigDecimal");
		selDTO.setCol("JOB_CD");
		selDTO.setTb_name("JOB_DETAIL");
		selDTO.setConditions(Arrays.asList("detail_value='"+certi+"'"));
	    sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
	    List<HashMap<String, BigDecimal>> mapList = resultHandler.getSel();
	    List<Integer> cdList = new ArrayList<>();
	    for (HashMap<String, BigDecimal> map : mapList) cdList.add(Integer.valueOf(map.get("JOB_CD").intValue()));
	    return cdList;
	}
	
	@Override
	public void createJobPoint(int user, int majorC, int certiC) {
		ArrayList<String> arr = null;
		ArrayList<String> arr2 = null;
		if(majorC !=0) {
			arr = new ArrayList<String>();
			for(int i = 1 ; i <= majorC; i++) arr.add("major"+i+" number");
		}
		if(certiC !=0) {
			arr2 = new ArrayList<String>();
			for(int i = 1 ; i <= certiC; i++) arr2.add("certi"+i+" number");
		}
		mapper.createJobPoint(user, arr, arr2);
	}
	@Override
	public void insertJobPoint(int num, int job_cd, double total, double [] detail, int majorC, int certiC) {
		ArrayList<Double> arr = null;
		ArrayList<Double> arr2 = null;
		if(majorC !=0) {
			arr = new ArrayList<Double>();
			for(int i = 0 ; i < majorC; i++) arr.add(detail[9+i]);
		}
		if(certiC !=0) {
			arr2 = new ArrayList<Double>();
			for(int i = 0 ; i < certiC; i++) arr2.add(detail[9+majorC+i]);
		}
		mapper.insertJobPoint(num, job_cd, total, detail[0], detail[1], detail[2], detail[3],
				detail[4], detail[5], detail[6], detail[7], detail[8], detail[9], arr, arr2);
	}
	@Override
	public List<HashMap<String, BigDecimal>> getJobPoint(SelectDTO selDTO, int user, int page, int count){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<BigDecimal> resultHandler = new SelectResultHandler<BigDecimal>();
		selDTO.setFullClassName("Double");
		selDTO.setCol("*");
		selDTO.setTb_name("JOB_POINT_"+user);
		selDTO.setOrder(" order by total desc ");
		selDTO.setEtc("FETCH FIRST "+ page*count + " ROWS ONLY");
	    sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		return resultHandler.getSel();
	}
	
	@Override
	public HashMap<String, String> getRecoList(SelectDTO selDTO, int user) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		selDTO.setCol("aptitude_name1, aptitude_name2, aptitude_name3, interest_name1 ,interest_name2, interest_name3");
		selDTO.setTb_name("recommand_info");
		selDTO.setConditions(Arrays.asList("num="+user));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
	    HashMap<String, String> mapList = resultHandler.getSelOne();
	    
	    return mapList;
	}
}
