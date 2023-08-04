package whou.secproject.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SearchLogDTO {
	private int num; // 번호
	private String email; // 누른 유저
	private String job; // 누른 직업
	private String keyword; // 검색어
	private Timestamp reg; // 시간
//	------------------------------------
	private int searchcount; // 검색 카운트
}
