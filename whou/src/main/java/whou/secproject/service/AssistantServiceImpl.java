package whou.secproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.AssistantDTO;
import whou.secproject.mapper.AdminFaqMapper;
import whou.secproject.mapper.AssistantMapper;

@Service
public class AssistantServiceImpl implements AssistantService{

	@Autowired
	private AssistantMapper assistantMapper;
	
	@Autowired
	private AdminFaqMapper adminFaqMapper;
	
	@Override
	public List<AssistantDTO> assistantList() {
		return assistantMapper.assistantList(); // 모든 챗봇 리스트
	}

	@Override
	public List<AssistantDTO> assistantRef_level1() {
		return assistantMapper.assistantRef_level1(); // 그룹 레벨 1인 챗봇 리스트
	}

	@Override
	public List<AssistantDTO> assistantSelectLevel(int ref) {
		return assistantMapper.assistantSelectLevel(ref); // 그릅 레벨이 2인 챗봇 그룹별 검색
	}

	@Override
	public int assistantRef(String qes) {
		return assistantMapper.assistantRef(qes); // 질문에 따른 그룹 검색
	}

	@Override
	public String assistantSelectCon(String qes) {
		return assistantMapper.assistantSelectCon(qes); // 질문에 따른 답변 검색
	}

	@Override
	public void assistantInsertList(AssistantDTO dto) {
		assistantMapper.assistantInsertList(dto); // 챗봇 리스트 입력
	}

	@Override
	public void assistantUpdateList(AssistantDTO dto) {
		assistantMapper.assistantUpdateList(dto); // 챗봇 리스트 수정
	}

	@Override
	public void assistantDelete(int num) {
		assistantMapper.assistantDelete(num); // 챗봇 리스트 삭제
	}

	@Override
	public int assistantCount() {
		return assistantMapper.assistantCount(); // 모든 챗봇 리스트 개수 세기
	}

	@Override
	public int adminUserLvCheck(String email) {
		return adminFaqMapper.adminUserLvCheck(email); // 현재 회원 레벨 체크
	}
}
