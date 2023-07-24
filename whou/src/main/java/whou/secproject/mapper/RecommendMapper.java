package whou.secproject.mapper;

import java.util.HashMap;
import java.util.List;

import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.SelectDTO;

public interface RecommendMapper {
	
	public RecommandInfoDTO getTestResult(int num);
	public List<Integer> allJobCd(String tb_name);
	public List<String> getValueCd(String tb_name);
	public <T extends SelectDTO> HashMap selectInfo(T selDTO);
}
