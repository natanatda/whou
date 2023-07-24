package whou.secproject.component;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class AdminFaqDTO {
	private int num; // 글번호
	private String category; // 카테고리
	private String subject; // 제목
	private String content; // 내용
	private Timestamp reg; // 작성일
	private int readcount; // 조회수
}
