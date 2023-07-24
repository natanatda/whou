package whou.secproject.mapper;

import whou.secproject.component.WhouModelCustomDTO;

public interface WhouModelCustomMapper {
	public WhouModelCustomDTO customModel(String email);
	public int customCount(String email);
	public void customInsert(WhouModelCustomDTO dto);
	public void customUpdate(WhouModelCustomDTO dto);
	public void customDelete(String email);
}
