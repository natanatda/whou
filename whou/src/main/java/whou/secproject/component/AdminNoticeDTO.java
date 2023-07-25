package whou.secproject.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminNoticeDTO {
	private int num; // 글 번호
	private String writer; // 작성자
	private String subject; // 제목
	private String content; // 내용
	private int readcount; // 조회수
	private Timestamp reg; // 작성일
}
