package whou.secproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.AdminFaqDTO;
import whou.secproject.mapper.AdminFaqMapper;

@Service
public class AdminFaqServiceImpl implements AdminFaqService {
	
	@Autowired
	private AdminFaqMapper mapper;
	
	@Override
	public List<AdminFaqDTO> faqList() { // faq 리스트
		return mapper.faqList();
	}

	@Override
	public List<AdminFaqDTO> faqCategory(String category) { // 카테고리별 검사
		return mapper.faqCategory(category);
	}

	@Override
	public void faqWrite(AdminFaqDTO dto) { // 작성
		mapper.faqWrite(dto);
	}

	@Override
	public void faqDelete(int num) { // 삭제
		mapper.faqDelete(num);
	}

	@Override
	public void faqReadCount(int num) { // 조회수 증가
		mapper.faqReadCount(num);
	}

	@Override
	public int adminUserLvCheck(String email) { // 레벨 검사
		return mapper.adminUserLvCheck(email);
	}
}
