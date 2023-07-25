package whou.secproject.component;

import lombok.Data;

@Data
public class AssistantDTO {
	private String qes; // 질문
	private String con; // 답변
	private int num; // 번호
	private int ref; // 그룹
	private int ref_level; // 그룹 레벨
}
