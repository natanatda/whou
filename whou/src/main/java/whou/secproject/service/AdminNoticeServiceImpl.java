package whou.secproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.AdminNoticeDTO;
import whou.secproject.mapper.AdminFaqMapper;
import whou.secproject.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	

	@Autowired
	private AdminNoticeMapper adminNoticeMapper;
	
	@Autowired
	private AdminFaqMapper adminFaqMapper;
	
	@Override
	public List<AdminNoticeDTO> noticeList(int start, int end) {		
		return adminNoticeMapper.noticeList(start, end); // 공지사항 리스트
	}

	@Override
	public AdminNoticeDTO myPageNotice() {
		return adminNoticeMapper.myPageNotice();
	}

	@Override
	public List<AdminNoticeDTO> noticeSearch(Map<String, Object> noticeSearch) {
		return adminNoticeMapper.noticeSearch(noticeSearch); // 검색
	}

	@Override
	public AdminNoticeDTO noticeDetail(int num) {
		return adminNoticeMapper.noticeDetail(num); // 상세보기
	}

	@Override
	public void noticeWrite(AdminNoticeDTO dto) {
		adminNoticeMapper.noticeWrite(dto); // 글작성		
	}

	@Override
	public void noticeReadCount(int num) {
		adminNoticeMapper.noticeReadCount(num); // 조회수 증가
	}
	@Override
	public int noticeCount() {
		return adminNoticeMapper.noticeCount(); // 공지사항 개수
	}

	@Override
	public void noticeModify(AdminNoticeDTO dto) {
		adminNoticeMapper.noticeModify(dto); // 수정
	}

	@Override
	public void noticeDelete(int num) {
		adminNoticeMapper.noticeDelete(num); // 삭제
	}

	@Override
	public int adminUserLvCheck(String email) {
		return adminFaqMapper.adminUserLvCheck(email); // 레벨 검사
	}
}
