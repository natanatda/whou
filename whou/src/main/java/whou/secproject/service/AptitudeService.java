package whou.secproject.service;

import java.util.List;

import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.TestVoDTO;

public interface AptitudeService {
	public AptitudeTestValueDTO testCrawling(String testURL, String qnum); //검사 결과를 크롤링
	public List<String> crawlingSplit(AptitudeTestValueDTO dto, String qnum);
	public List<String []> crawlingSplitArr(AptitudeTestValueDTO dto, String qnum);
	public List<String> crawlingSplitRank(AptitudeTestValueDTO dto, String qnum);
	public List<String> crawlingSplitJob(AptitudeTestValueDTO dto, String qnum);
	
	public void crawlingInsert(AptitudeTestValueDTO dto); //크롤링한 검사 결과를 DB에 저장
	public List<String> reportView(String qnum, AptitudeTestValueDTO dto); //크롤링 결과 출력할 수 있게 list로 가공
	public void temporarySaveInsert(List<String> answers, AptitudeTestTemporarySaveDTO dto, String qnum); //임시 저장
	
	public List<AptitudeTestValueDTO> getRecentTest(AptitudeTestValueDTO dto); //검사 메인의 검사횟수 및 최근검사일
	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(AptitudeTestTemporarySaveDTO dto); //임시저장한 값
	
	public void temporarySaveDelete(int test_num); //임시저장한 검사지 제출하면 삭제
	public void temporarySaveUpdate(List<String> answers, AptitudeTestTemporarySaveDTO dto, String qnum); //임시저장한 검사지를 다시 임시저장
	
	
	// 추천 테이블 관련 작업
	public int userNumSelect(String memId); // userNum 추출
	public void userNumInsert(int userNum); // userNum 저장
	public int userNumCount(int userNum); // userNum 저장
	public String valuesJob();// 가치관 결과지 - 관련 직업번호 추출
	public void valuesInsert(String result); // 가치관 번호 저장
	public String jobSelect(String jobListItem);
	
	public String aptdSelect(String sortName); // 적성
	public void interestUpdate(RecommandInfoDTO dtoRe, int userNum);//흥미 직업 번호 저장
	public void aptitudeUpdate(RecommandInfoDTO dtoRe, int userNum);//적성 직업 번호 저장
	public void valuesUpdate(String score, int userNum); //가지관 차트 점수 저장
}
