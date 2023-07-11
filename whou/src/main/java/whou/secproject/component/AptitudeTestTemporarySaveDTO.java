package whou.secproject.component;

import java.sql.Timestamp;

public class AptitudeTestTemporarySaveDTO {
	private String test_name;
	private int test_num;
	private String test_answers;
	private Timestamp test_date;
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public int getTest_num() {
		return test_num;
	}
	public void setTest_num(int test_num) {
		this.test_num = test_num;
	}
	public String getTest_answers() {
		return test_answers;
	}
	public void setTest_answers(String test_answers) {
		this.test_answers = test_answers;
	}
	public Timestamp getTest_date() {
		return test_date;
	}
	public void setTest_date(Timestamp test_date) {
		this.test_date = test_date;
	}
	
	
	
}
