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
	public ArrayList<String> certiInfo(CertiDTO certi) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		SelectResultHandler<String> resultHandler = new SelectResultHandler<String>();
		certi.setFullClassName("String");
		certi.setCol("school_major");
		certi.setTb_name("user_info");
		certi.setConditions(Arrays.asList("num=#{num}"));
	    sqlSession.select("whou.secproject.mapper.RecommendMapper.selectInfo", certi, resultHandler);
		sqlSession.close();
	    HashMap<String,String> map = resultHandler.getSelOne();
	    String certis = map.get("SCHOOL_MAJOR");
		ArrayList<String> tokens = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(certis,",");
		while(st.hasMoreTokens()) tokens.add(st.nextToken());
		return tokens;
		
	}
	public List<Integer> certiToCD(SelectDTO selDTO, String certi){
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
}
