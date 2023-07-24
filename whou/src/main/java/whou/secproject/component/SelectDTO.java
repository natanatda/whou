package whou.secproject.component;

import java.util.List;

import lombok.Data;

@Data
public class SelectDTO {
	private String col;
	private String tb_name;
	private List<String> conditions;
	private String className;
	private String fullClassName;
	public void setClassName(String className) {
		this.fullClassName = "whou.secproject.component."+className+"DTO";
		this.className = className;
	}
}
