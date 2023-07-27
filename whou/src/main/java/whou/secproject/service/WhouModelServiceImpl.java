package whou.secproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.WhouModelDTO;
import whou.secproject.mapper.WhouModelMapper;

@Service
public class WhouModelServiceImpl implements WhouModelService {

	@Autowired
	private WhouModelMapper whouModelMapper;
	
	@Override
	public WhouModelDTO selectModel(int num) {
		return whouModelMapper.selectModel(num);
	}

	@Override
	public List<WhouModelDTO> selectModel2() {
		return whouModelMapper.selectModel2();
	}

	@Override
	public int selectSortValue(int seq) {
		return whouModelMapper.selectSortValue(seq);
	}

}
