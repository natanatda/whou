package whou.secproject.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.mapper.MainMapper;


@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;

	
	
	// 마이페이지 rank 검색
//	@Override
//	public RecommandInfoDTO getAptitudeRank(int userNum) {
//		
//	}

	
}
