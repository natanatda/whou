package whou.secproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.TestReinforcementDTO;
import whou.secproject.component.Job_infoDTO;

public interface MemberMapper {
	public int count(String tel);
	public int check(String email);
	public String join_type(String email);
	public String login(String email);
	public String getEmail(@Param("name") String name, @Param("tel") String tel);
	public void insert2(String email);
	public void insertPro(MemberDTO dto);
	public List<String> getCerti(String certi);
	public List<String> getMajor(@Param("major")String major, @Param("univSe")String univSe);
	public void updateInfo(@Param("combinedCerti")String combinedCerti, @Param("combinedMajor")String combinedMajor, @Param("memId")String memId);
	
	// 마이페이지
	public RecommandInfoDTO getAptitudeRank(int userNum);
	public void updateBook(@Param("memId")String memId, @Param("books")String books);
	public String getBook(String memId);

	
	// sj write
	public int getCunsultingNum(int user_info_num); // user_info의 num을 이용하여 cunsulting_num 컬럼 값 get
	public String getRecentTest21(int userNum); //역량 보완법을 위해 크롤링한 결과에서 21번 테스트의 역량별 수치 가져옴
	public TestReinforcementDTO getTestReinforcement(int num); // 역량 보완법 가져옴

	public MemberDTO getUser(int userNum);
	public Job_infoDTO getJob(int job_cd);

}
