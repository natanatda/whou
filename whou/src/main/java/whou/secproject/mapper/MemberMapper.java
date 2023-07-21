package whou.secproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.MemberDTO;

public interface MemberMapper {
	public int count(String tel);
	public int check(String email);
	public String join_type(String email);
	public String login(String email);
	public String getEmail(@Param("name") String name, @Param("tel") String tel);
	public void insert2(String email);
	public void insertPro(MemberDTO dto);
	public List<String> getCerti(String certi);
	public List<String> getMajor(String major);
	public void updateInfo(@Param("combinedCerti")String combinedCerti, @Param("combinedMajor")String combinedMajor);
}
