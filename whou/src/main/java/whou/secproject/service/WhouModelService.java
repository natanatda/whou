package whou.secproject.service;

import java.util.List;

import whou.secproject.component.WhouModelDTO;

public interface WhouModelService {
	public WhouModelDTO selectModel(int num);
	public List<WhouModelDTO> selectModel2();
	public int selectSortValue(int seq);
}
