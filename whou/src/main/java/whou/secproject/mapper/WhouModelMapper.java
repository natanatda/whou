package whou.secproject.mapper;

import java.util.List;

import whou.secproject.component.WhouModelDTO;

public interface WhouModelMapper {
	public WhouModelDTO selectModel(int num);
	public List<WhouModelDTO> selectModel2();
	public int selectSortValue(int seq);
}
