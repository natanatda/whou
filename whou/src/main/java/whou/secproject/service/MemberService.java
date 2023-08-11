package whou.secproject.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;

import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.TestReinforcementDTO;
import whou.secproject.component.UserInfoDTO;

public interface MemberService {
    public int count(String tel);
    public int check(String email);
    public int num(String email);
    public String join_type(String email);
    public String login(String email);
    public String getEmail(String name, String tel);
    public void insert2(String email, int num);
    public void insertPro(MemberDTO dto);
    public String getAccessToken (String authorize_code);
    public String getUserInfo (String access_Token);
	public ResponseEntity<String> getInfo(String ACCESS_TOKEN) throws IOException;
	public void telChk(String tel, String numStr);
	
	//추가정보(자격증&학과)
	public List<String> getCerti(String certi);
	public List<String> getMajor(String major, String univSe);
	public void updateInfo(List<String> certiList, List<String> majorList, String memId);
	
	//북마크
	public void updateBook(String job_cd, String memId, boolean contain);
	public Job_infoDTO getJob(int job_cd);
	
	//회원정보수정
	public MemberDTO getUser(int userNum);
	public UserInfoDTO userInfo(int userNum);
	public void updateUser(MemberDTO dto);
	public void updatePw(String pw, String memId);
	public void deleteMajor(String major, String memId);
	public void deleteCerti(String certi, String memId);
	
	//회원탈퇴
	public void dropTest_Result(int UserNum);
	public void dropTest_Save(int userNum);
	public void deleteUser_info(int userNum);
	public void deleteUser(int userNum);
	public void deleteRecommand_info(int userNum);
	public void deleteModel(String email);
	
	public String Nremove(String access_Token);
	
	
	//네이버 회원탈퇴
	//public String requestToServer(String apiURL) throws IOException;
	//public String requestToServer(String apiURL, String headerStr) throws IOException;
	
	// 마이페이지
	public RecommandInfoDTO getAptitudeRank(int userNum);
	public String getTempSave(String memId);
    
	
	public Integer getCunsultingNum(int user_info_num); // user_info의 num을 이용하여 cunsulting_num 컬럼 값 get
	public String getRecentTest21(int userNum); //역량 보완법을 위해 크롤링한 결과에서 21번 테스트의 역량별 수치 가져옴
	public TestReinforcementDTO getTestReinforcement(int num); // 역량 보완법 가져옴
	
	// level 가져오기
	public int level(String email);

	// 관리자 페이지
	public void adminInsert(MemberDTO dto);
	public List<MemberDTO> getAdmin();
	public void deleteAdmin(String email);
}

