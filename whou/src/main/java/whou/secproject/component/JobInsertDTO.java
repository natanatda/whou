package whou.secproject.component;

import lombok.Data;

@Data
public class JobInsertDTO {
	private String tb_name;
	private int num;
	private String factor;
	private String factor_value;
	private String value;
	
	private String tb_value;
	private String inform;
	private int importance;
	private String source;
}
