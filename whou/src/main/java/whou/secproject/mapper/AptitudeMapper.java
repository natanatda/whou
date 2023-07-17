package whou.secproject.mapper;

import java.util.List;

import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTO;
import whou.secproject.component.RecommandInfoDTO;

public interface AptitudeMapper {
	public void crawlingInsert(AptitudeTestValueDTO dto); //크롤링 결과 DB에 넣기
	public void temporarySaveInsert(AptitudeTestTemporarySaveDTO dto); //임시저장 값 DB에 넣기
	public List<AptitudeTestValueDTO> getRecentTest(AptitudeTestValueDTO dto); // 검사 결과 회수와 최근일자
	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(AptitudeTestTemporarySaveDTO dto); //임시저장한 값
	public void temporarySaveDelete(int test_num); //임시저장한 검사지 제출하면 삭제
	public void temporarySaveUpdate(AptitudeTestTemporarySaveDTO dto); //임시저장한 검사지를 다시 임시저장
	
	// 추천 테이블 관련 작업
	public String valuesJob(String job_cd);
	public void valuesInsert(String result); // 가치관 번호 저장
	public String jobSelect(String jobListItem);
	public String aptdSelect(String sortName); // 적성
	public void interesteInsert(RecommandInfoDTO dtoRe);//흥미 직업 번호저장
	public void aptitudeUpdate(RecommandInfoDTO dtoRe);//적성 직업 번호 저장
	public void valuesUpdate(RecommandInfoDTO dtoRe); //가지관 차트 점수 저장
}
