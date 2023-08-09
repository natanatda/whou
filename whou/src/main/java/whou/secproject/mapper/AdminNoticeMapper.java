package whou.secproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.AdminNoticeDTO;

public interface AdminNoticeMapper {
	// 공지사항 리스트
	public List<AdminNoticeDTO> noticeList(@Param("start")int start, @Param("end")int end);
	// 검색
	public List<AdminNoticeDTO> noticeSearch(Map<String,Object> noticeSearch);
	// 마이페이지 공지사항
	public AdminNoticeDTO myPageNotice();
	// 상세보기
	public AdminNoticeDTO noticeDetail(int num);
	// 글작성
	public void noticeWrite(AdminNoticeDTO dto);
	// 수정
	public void noticeModify(AdminNoticeDTO dto);
	// 조회수 증가
	public void noticeReadCount(int num);
	// 공지사항 개수
	public int noticeCount();
	// 삭제
	public void noticeDelete(int num);
	// 레벨 검사
	public int adminUserLvCheck(String email);
}
