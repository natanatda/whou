package whou.secproject.component;
import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private String email;
	private String pw;
	private String name;
	private String birth_year;
	private String tel;
	private String gender;
	private int lv;
	private Date date;
    private String join_type;
}
