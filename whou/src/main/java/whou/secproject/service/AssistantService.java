package whou.secproject.service;

import java.util.List;

import whou.secproject.component.AssistantDTO;

public interface AssistantService {
	public List<AssistantDTO> assistantList(); // 모든 챗봇 리스트
	public List<AssistantDTO> assistantRef_level1(); // 그룹 레벨 1인 챗봇 리스트
	public List<AssistantDTO> assistantSelectLevel(int ref); // 그릅 레벨이 2인 챗봇 그룹별 검색
	public int assistantRef(String qes); // 질문에 따른 그룹 검색
	public String assistantSelectCon(String qes); // 질문에 따른 답변 검색
	public void assistantInsertList(AssistantDTO dto); // 챗봇 리스트 입력
	public void assistantUpdateList(AssistantDTO dto); // 챗봇 리스트 수정
	public void assistantDelete(int num); // 챗봇 리스트 삭제
	public int assistantCount(); // 모든 챗봇 리스트 개수 세기
	public int adminUserLvCheck(String email); // 현재 회원 레벨 체크
}
