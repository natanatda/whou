package whou.secproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.SearchLogDTO;
import whou.secproject.mapper.JobSearchLogMapper;

@Service
public class JobSearchLogServiceImpl implements JobSearchLogService{

	@Autowired
	JobSearchLogMapper jobSearchLogMapper;
	
	@Override
	public int isSearchList(String keyword) {
		return jobSearchLogMapper.isSearchList(keyword);
	}

	@Override
	public int isCountJob() {
		return jobSearchLogMapper.isCountJob();
	}

	@Override
	public int isCountKeyWord() {
		return jobSearchLogMapper.isCountKeyWord();
	}

	@Override
	public List<SearchLogDTO> countJob(String jobDateSelect, String nowDate, String start, String end,int rownum) {
		return jobSearchLogMapper.countJob(jobDateSelect, nowDate, start, end, rownum);
	}

	@Override
	public List<SearchLogDTO> countKeyWord(String keyDateSelect, String nowDate, String start, String end,int rownum) {
		return jobSearchLogMapper.countKeyWord(keyDateSelect, nowDate, start, end, rownum);
	}

	@Override
	public void insertSearchList(String keyWord) {
		jobSearchLogMapper.insertSearchList(keyWord);
	}

	@Override
	public void updateSearchList(String keyWord) {
		jobSearchLogMapper.updateSearchList(keyWord);
	}

	@Override
	public void insertSearchLog(SearchLogDTO dto) {
		jobSearchLogMapper.insertSearchLog(dto);
	}
	
}
