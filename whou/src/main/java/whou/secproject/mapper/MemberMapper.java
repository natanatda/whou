package whou.secproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecommandInfoDTO;

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
}
