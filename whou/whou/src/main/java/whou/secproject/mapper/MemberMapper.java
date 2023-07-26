package whou.secproject.mapper;

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
}
