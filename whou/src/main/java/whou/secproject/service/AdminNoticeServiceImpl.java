package whou.secproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.AdminNoticeDTO;
import whou.secproject.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	

	@Autowired
	private AdminNoticeMapper mapper;

	@Override
	public List<AdminNoticeDTO> noticeList(int start, int end) {		
		return mapper.noticeList(start, end); // 공지사항 리스트
	}

	@Override
	public List<AdminNoticeDTO> noticeSearch(String option, String word) {
		return mapper.noticeSearch(option, word); // 검색
	}

	@Override
	public AdminNoticeDTO noticeDetail(int num) {
		return mapper.noticeDetail(num); // 상세보기
	}

	@Override
	public void noticeWrite(AdminNoticeDTO dto) {
		mapper.noticeWrite(dto); // 글작성		
	}

	@Override
	public void noticeReadCount(int num) {
		mapper.noticeReadCount(num); // 조회수 증가
	}
	@Override
	public int noticeCount() {
		return mapper.noticeCount(); // 공지사항 개수
	}

	@Override
	public void noticeModify(AdminNoticeDTO dto) {
		mapper.noticeModify(dto); // 수정
	}

	@Override
	public void noticeDelete(int num) {
		mapper.noticeDelete(num); // 삭제
	}

	@Override
	public int noticeUserLvCheck(String email) {
		return mapper.noticeUserLvCheck(email); // 레벨 검사
	}
}
