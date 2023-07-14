package whou.secproject.service;

import java.util.List;

import whou.secproject.component.Kirby_Job_CustomDTO;

public interface Kirby_Job_CustomService {
	public Kirby_Job_CustomDTO selectKirby(int num);
	public List<Kirby_Job_CustomDTO> selectKirby2();
}
