package whou.secproject.service;

import java.util.ArrayList;
import java.util.List;

import whou.secproject.component.CertiDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.SelectDTO;


public interface RecommendService {
	public RecommandInfoDTO getTestResult(int num);
	public List<Integer> allJobCd(String tb_name);
	public List<String> getValueCd(String tb_name);
	public ArrayList<String> certiInfo(CertiDTO certi);
	public List<Integer> certiToCD(SelectDTO selDTO, String certi);
}
