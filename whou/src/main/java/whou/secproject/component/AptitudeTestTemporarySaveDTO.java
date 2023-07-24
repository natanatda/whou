package whou.secproject.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AptitudeTestTemporarySaveDTO {
	private int userNum;
	private String test_name;
	private int test_num;
	private String test_answers;
	private Timestamp test_date;
	
}
