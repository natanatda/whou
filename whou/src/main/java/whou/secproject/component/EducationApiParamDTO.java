package whou.secproject.component;

import lombok.Data;

@Data
public class EducationApiParamDTO {
	//커리어 넷
	private String univSe; //대학 전문대학
	private String subject; // 학과 계열
	private String thisPage; //현재페이지
	private String perPage; //한페이지당 건수
	private String perPageSet; //사용자 입력 값 검사
	private String searchTitle; //검색어
	private String majorSeq; //상세페이지 경우, 학과 코드
	
}
