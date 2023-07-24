package whou.secproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.WhouModelCustomDTO;
import whou.secproject.mapper.WhouModelCustomMapper;

@Service
public class WhouModelCustomServiceImpl implements WhouModelCustomService {

	@Autowired
	WhouModelCustomMapper whouModelCustomMapper;
	
	@Override
	public WhouModelCustomDTO customModel(String email) {
		return whouModelCustomMapper.customModel(email);
	}

	@Override
	public int customCount(String email) {
		return whouModelCustomMapper.customCount(email);
	}

	@Override
	public void customInsert(WhouModelCustomDTO dto) {
		whouModelCustomMapper.customInsert(dto);
	}

	@Override
	public void customUpdate(WhouModelCustomDTO dto) {
		whouModelCustomMapper.customUpdate(dto);
	}

	@Override
	public void customDelete(String email) {
		whouModelCustomMapper.customDelete(email);
	}

}
