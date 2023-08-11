package whou.secproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.TestReinforcementDTO;
import whou.secproject.component.UserInfoDTO;

public interface MemberMapper {
	//회원가입&로그인
	public int count(String tel);
	public int check(String email);
	public int num(String email);
	public String join_type(String email);
	public String login(String email);
	public String getEmail(@Param("name") String name, @Param("tel") String tel);
	public void insert2(@Param("email")String email, @Param("num")int num);
	public void insertPro(MemberDTO dto);
	
	//추가정보(자격증&학과)
	public List<String> getCerti(String certi);
	public List<String> getMajor(@Param("major")String major, @Param("univSe")String univSe);
	public void updateInfo(@Param("combinedCerti")String combinedCerti, @Param("combinedMajor")String combinedMajor, @Param("memId")String memId);
	public String getUserCerti(String memId);
	public String getUserMajor(String memId);
	
	//북마크
	public void updateBook(@Param("memId")String memId, @Param("books")String books);
	public String getBook(String memId);
	public Job_infoDTO getJob(int job_cd);
	
	//회원정보 수정
	public MemberDTO getUser(int userNum);
	public UserInfoDTO userInfo(int userNum);
	public void updateUser(MemberDTO dto);
	public void updatePw(@Param("pw")String pw, @Param("memId")String memId);
	public void deleteMajor(@Param("memId")String memId, @Param("db")String db);
	public void deleteCerti(@Param("memId")String memId, @Param("db")String db);

	//회원탈퇴
	public void dropTest_Result(int UserNum);
	public void dropTest_Save(int UserNum);
	public void deleteUser_info(int UserNum);
	public void deleteUser(int UserNum);
	public void deleteRecommand_info(int UserNum);
	public void deleteModel(String email);
	
	
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
