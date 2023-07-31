package whou.secproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTO;
import whou.secproject.component.RecommandInfoDTO;

public interface AptitudeMapper {
	public void crawlingInsert(@Param("dto") AptitudeTestValueDTO dto, @Param("userNum") int userNum); //크롤링 결과 DB에 넣기
	public void temporarySaveInsert(@Param("dtoSv") AptitudeTestTemporarySaveDTO dto, @Param("userNum") int userNum); //임시저장 값 DB에 넣기
	public List<AptitudeTestValueDTO> getRecentTest(@Param("dto") AptitudeTestValueDTO dto, @Param("userNum") int userNum); // 검사 결과 회수와 최근일자
//	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(@Param("dtoSv") AptitudeTestTemporarySaveDTO dto, @Param("userNum") int userNum); //임시저장한 값
	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(AptitudeTestTemporarySaveDTO dto); //임시저장한 값
	public void temporarySaveDelete(@Param("test_num") int test_num, @Param("userNum") int userNum); //임시저장한 검사지 제출하면 삭제
	public void temporarySaveUpdate(@Param("dtoSv") AptitudeTestTemporarySaveDTO dto, @Param("userNum") int userNum); //임시저장한 검사지를 다시 임시저장
	
	// 추천 테이블 관련 작업
	public int userNumSelect(String memId);// userNum 추출
	public void userNumInsert(int userNum); // userNum 저장
	public int userNumCount(int userNum); // userNum 저장
	public String valuesJob(String job_cd);
	public void valuesInsert(String result); // 가치관 번호 저장
	public String jobSelect(String jobListItem);
	public String aptdSelect(String sortName); // 적성
	public void interestUpdate(@Param("dtoRe") RecommandInfoDTO dtoRe, @Param("userNum") int userNum);//흥미 직업 번호저장
	public void aptitudeUpdate(@Param("dtoRe") RecommandInfoDTO dtoRe, @Param("userNum") int userNum);//적성 직업 번호 저장
	public void valuesUpdate(@Param("score") String score, @Param("userNum") int userNum); //가지관 차트 점수 저장
	public void aptitudeScoreUpdate(@Param("dtoRe") RecommandInfoDTO dtoRe, @Param("userNum") int userNum); //적성 차트 점수 저장
	public void interestScoreUpdate(@Param("dtoRe") RecommandInfoDTO dtoRe, @Param("userNum") int userNum); //흥미 차트 점수 저장
	public void saveAptitudeScoreName(@Param("dto") AptitudeTestValueDTO dto, @Param("qnum") String qnum);// 적성 차트 이름 저장
	public void saveAptitudeScoreName(@Param("dto") AptitudeTestValueDTO dto, @Param("qnum") String qnum, @Param("userNum") int userNum);
	public void saveAbilityScore(@Param("abilityScore") String abilityScore, @Param("userNum") int userNum); //역량점수저장

	public String getName(String memId);//세션으로 이름 꺼내기
	
	public void createUserTable(int userNum);// 회원가입시 테이블 생성
	public void createSequence(int userNum);// 회원가입시 테이블 생성
	public void createuSaveTable(int userNum);// 회원가입시 테이블 생성
	// 검사하면 user 테이블에 1 업데이트
	public void commendNumUpdate(String memId);
	
	// 마이페이지 차트 점수
	public String getAptitudeScore(int userNum);
	public String getInterestScore(int userNum);
	public String getValuesScore(int userNum);
	public String getAptitudeScoreName(int userNum); //적성 점수 이름
	public String getAbilityScore(int userNum);//역량점수
	public void updatePercent(@Param("userNum")int userNum, @Param("percents")String percents);
	public String getPercent(int userNum);
}
