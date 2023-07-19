package whou.secproject.component;

import lombok.Data;

@Data
public class EducationHrdParamDTO {
	
	private String trainGb;
	private String srchTraOrganNm; //기관검색
	private String srchTraProcessNm; //과정 검색
	private String srchTraStDt;
	private String srchTraEndDt;
	private String pageNum;
	private String pageSize;
	private String sort; // 오름차순/내림차순
	private String srchTraGbn; //훈련구분
	private String srchTraArea1; //지역
	
	private String srchNcs1; // 내일배움카드 NCS 직종 대분류 코드
	private String srchKeco1; //사업주훈련,국가인적자원개발 컨소시엄,일학습병행 훈련분야 대분류 코드
}
