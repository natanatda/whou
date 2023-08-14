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
			for(int i = 0 ; i < majorC; i++) arr.add(detail[10+i]);
		}
		if(certiC !=0) {
			arr2 = new ArrayList<Double>();
			for(int i = 0 ; i < certiC; i++) arr2.add(detail[10+majorC+i]);
		}
		mapper.insertJobPoint(num, job_cd, total, detail[0], detail[1], detail[2], detail[3],
				detail[4], detail[5], detail[6], detail[7], detail[8], detail[9], arr, arr2);
	}
	@Override
	public List<HashMap<String, BigDecimal>> getJobPoint(SelectDTO selDTO, int user, int page, int count, String col){
		SqlSession sqlSession = sqlSessionFactory.openSession(); // 1 5 2 5 
		SelectResultHandler<BigDecimal> resultHandler = new SelectResultHandler<BigDecimal>();
		selDTO.setFullClassName("Double");
		selDTO.setCol(col);
		selDTO.setTb_name("JOB_POINT_"+user);
		selDTO.setEtc("OFFSET "+(count*(page-1))+" ROWS FETCH FIRST "+ count + " ROWS ONLY");
	    sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		return resultHandler.getSel();
	}
	@Override
	public List<HashMap<String, BigDecimal>> getJobPointNM(SelectDTO selDTO, int user, int page, int count, String col){
		SqlSession sqlSession = sqlSessionFactory.openSession(); // 1 5 2 5 
		SelectResultHandler<BigDecimal> resultHandler = new SelectResultHandler<BigDecimal>();
		selDTO.setFullClassName("Double");
		selDTO.setCol(col);
		selDTO.setTb_name("(SELECT t2.job_nm,t1.* FROM job_point_"+user+" t1 JOIN job_info t2 ON t1.job_cd = t2.job_cd)");
		selDTO.setEtc("OFFSET "+(count*(page-1))+" ROWS FETCH FIRST "+ count + " ROWS ONLY");
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
	@Override
	public void dropTable(int num) {
		mapper.dropTable(num);
		mapper.updateFalse(num);
	}
	@Override
	public int tbTrue(int user) {
		SelectDTO selDTO = new SelectDTO();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<BigDecimal> resultHandler = new SelectResultHandler<BigDecimal>();
		selDTO.setCol("count(*)");
		selDTO.setTb_name("all_tables");
		selDTO.setConditions(Arrays.asList("table_name='JOB_POINT_"+user+"'"));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
	    HashMap<String, BigDecimal> mapList = resultHandler.getSelOne();
	    return mapList.get("COUNT(*)").intValue();
	}
	@Override
	public String getJname(SelectDTO selDTO,int job_cd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		selDTO.setCol("JOB_NM");
		selDTO.setTb_name("JOB_INFO");
		selDTO.setConditions(Arrays.asList("JOB_CD="+job_cd));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		return resultHandler.getSelOne().get("JOB_NM");
	}
	@Override
	public int updateTrue(int user) {
		SelectDTO selDTO = new SelectDTO();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<BigDecimal> resultHandler = new SelectResultHandler<BigDecimal>();
		selDTO.setCol("UPDATE_TRUE");
		selDTO.setTb_name("USER_INFO");
		selDTO.setConditions(Arrays.asList("NUM="+user));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		if(resultHandler.getSelOne()==null) return 0;
		else return resultHandler.getSelOne().get(selDTO.getCol()).intValue();
	}
	@Override
	public ArrayList<Integer> getImportances(int user){
		SelectDTO selDTO = new SelectDTO();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		selDTO.setCol("FACTOR_IMPORTANT");
		selDTO.setTb_name("USER_INFO");
		selDTO.setConditions(Arrays.asList("NUM="+user));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		if(resultHandler.getSelOne()!=null) {
			StringTokenizer st = new StringTokenizer(resultHandler.getSelOne().get(selDTO.getCol()),",");
			ArrayList<Integer> arr = new ArrayList<Integer>();
			while(st.hasMoreTokens()) {
				arr.add(Integer.parseInt(st.nextToken()));
			}
			return arr;
		}
		return null;
	}
	@Override
	public void insertConsult(int user,int job_cd) {
		mapper.insertConsult(user, job_cd);
	}
	
	@Override
	public List<HashMap<String, Object>> getJob_NM(String job_nm) {
		if(job_nm!=""&&job_nm!=null) {
			SelectDTO selDTO = new SelectDTO();
			SqlSession sqlSession = sqlSessionFactory.openSession();
			SelectResultHandler<Object> resultHandler = new SelectResultHandler<Object>();
			selDTO.setCol("JOB_CD,JOB_NM");
			selDTO.setTb_name("JOB_INFO");
			selDTO.setConditions(Arrays.asList("JOB_NM like '%"+job_nm+"%'"));
			selDTO.setOrder(" order by job_cd");
			sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
			sqlSession.close();
			List<HashMap<String, Object>> result = resultHandler.getSel();
			return result;
		}
		return null;
	}
	@Override
	public List<HashMap<String, String>> getJobDetail(int job_cd) {
		SelectDTO selDTO = new SelectDTO();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		selDTO.setCol("WORKS");
		selDTO.setTb_name("JOB_INFO");
		selDTO.setConditions(Arrays.asList("job_cd="+job_cd));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		selDTO.setCol("DETAIL_VALUE");
		selDTO.setTb_name("JOB_DETAIL");
		selDTO.setConditions(Arrays.asList("job_cd="+job_cd+"","factor_detail='ability_name'"));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		return resultHandler.getSel();
	}
	@Override
	public HashMap<String, String> getJobFactor(int job_cd) {
		SelectDTO selDTO = new SelectDTO();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		selDTO.setCol("DETAIL_VALUE");
		selDTO.setTb_name("JOB_DETAIL");
		selDTO.setConditions(Arrays.asList("job_cd="+job_cd+"","factor_detail='ability_name'"));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		return resultHandler.getSelOne();
	}
	
	@Override
	public HashMap<String,String> getJobTagByTal(String tals){
		if(tals.equals("자기성찰능력")) tals = "자아성찰능력";
		SelectDTO selDTO = new SelectDTO();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		selDTO.setCol("SORT_ICON");
		selDTO.setTb_name("APTD_FACTOR");
		selDTO.setConditions(Arrays.asList("sort_name='"+tals+"'"));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		return resultHandler.getSelOne();
	}
	@Override
	public void setImportances(int user,String [] arr) {
		mapper.setImportances(user, String.join(",", arr));
	}
	@Override
	public List<Integer> getJobLi(String tals){
		return mapper.getJobLi(tals);
	}
	
	@Override
	public List<Integer> getInteLi(String tals){
		SelectDTO selDTO = new SelectDTO();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		selDTO.setCol("JOB_CDS");
		selDTO.setTb_name("JOB_INTE_CD");
		selDTO.setConditions(Arrays.asList("INTE_NM='"+tals+"'"));
		sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", selDTO, resultHandler);
		sqlSession.close();
		StringTokenizer st = new StringTokenizer(resultHandler.getSelOne().get(selDTO.getCol()),",");
		ArrayList<Integer> arr = new ArrayList<Integer>();
		while(st.hasMoreTokens()) {
			arr.add(Integer.parseInt(st.nextToken()));
		}
		return arr;
	}

}
