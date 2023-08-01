package whou.secproject.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.mapper.MainMapper;


@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;

	// icon 가져오기
	@Override
	public String selectIcon(int code) {
		return mapper.selectIcon(code);
	}
	
	@Override
	public String selectRecoMessage(String tal){
		return mapper.selectRecoMessage(tal);
	}
}
