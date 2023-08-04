package whou.secproject.component;

import lombok.Data;

@Data
public class SearchListDTO {
	private int num; // 번호
	private String keyword; // 검색어
	private int search_count; // 검색횟수
}
