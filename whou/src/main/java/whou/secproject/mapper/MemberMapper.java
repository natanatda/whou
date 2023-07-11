package whou.secproject.mapper;

import whou.secproject.component.MemberDTO;

public interface MemberMapper {
	public int count(String tel);
	public int check(String email);
	public String join(String email);
	public void insert2(String email);
	public void insertPro(MemberDTO dto);
}
