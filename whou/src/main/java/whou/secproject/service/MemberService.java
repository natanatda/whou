package whou.secproject.service;

import java.io.IOException;
import java.util.List;

import org.springframework.http.ResponseEntity;

import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.TestReinforcementDTO;

public interface MemberService {
    public int count(String tel);
    public int check(String email);
    public String join_type(String email);
    public String login(String email);
    public String getEmail(String name, String tel);
    public void insert2(String email);
    public void insertPro(MemberDTO dto);
    public String getAccessToken (String authorize_code);
    public String getUserInfo (String access_Token);
	public ResponseEntity<String> getInfo(String ACCESS_TOKEN) throws IOException;
	public void telChk(String tel, String numStr);
	public List<String> getCerti(String certi);
	public List<String> getMajor(String major, String univSe);
	public void updateInfo(String combinedCerti, String combinedMajor, String memId);
	
	
	// 마이페이지
	public RecommandInfoDTO getAptitudeRank(int userNum);
	public void updateBook(String job_cd, String memId, boolean contain);

	
	public Integer getCunsultingNum(int user_info_num); // user_info의 num을 이용하여 cunsulting_num 컬럼 값 get
	public String getRecentTest21(int userNum); //역량 보완법을 위해 크롤링한 결과에서 21번 테스트의 역량별 수치 가져옴
	public TestReinforcementDTO getTestReinforcement(int num); // 역량 보완법 가져옴

	public MemberDTO getUser(int userNum);
	public Job_infoDTO getJob(int job_cd);

}

