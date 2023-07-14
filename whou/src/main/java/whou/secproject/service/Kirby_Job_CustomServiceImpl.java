package whou.secproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.Kirby_Job_CustomDTO;
import whou.secproject.mapper.Kirby_Job_CustomMapper;

@Service
public class Kirby_Job_CustomServiceImpl implements Kirby_Job_CustomService {

	@Autowired
	private Kirby_Job_CustomMapper mapper;
	
	@Override
	public Kirby_Job_CustomDTO selectKirby(int num) {
		return mapper.selectKirby(num);
	}

	@Override
	public List<Kirby_Job_CustomDTO> selectKirby2() {
		return mapper.selectKirby2();
	}

	

}
