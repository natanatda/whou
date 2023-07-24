package whou.secproject.service;

import whou.secproject.component.WhouModelCustomDTO;

public interface WhouModelCustomService {
	public WhouModelCustomDTO customModel(String email);
	public int customCount(String email);
	public void customInsert(WhouModelCustomDTO dto);
	public void customUpdate(WhouModelCustomDTO dto);
	public void customDelete(String email);
}
