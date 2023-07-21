package whou.secproject.service;

import java.util.List;

import whou.secproject.component.AdminFaqDTO;

public interface AdminFaqService {
	public List<AdminFaqDTO> faqList(); // faq 리스트 (조회수 높은 순서로 정렬)
	public List<AdminFaqDTO> faqCategory(String category); // 카테고리별 검색 (조회수 높은 순서로 정렬)
	public void faqWrite(AdminFaqDTO dto); // 작성
	public void faqDelete(int num); // 삭제
	public void faqReadCount(int num); // 조회수 증가
	public int adminUserLvCheck(String email); // 레벨 검사
}
