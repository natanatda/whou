package whou.secproject.component;

import java.sql.Timestamp;

public class AptitudeTestTemporarySaveDTO {
	private int indexNum;
	private int testNum;
	private String testAnswers;
	private Timestamp testDate;
	public int getIndexNum() {
		return indexNum;
	}
	public void setIndexNum(int indexNum) {
		this.indexNum = indexNum;
	}
	public int getTestNum() {
		return testNum;
	}
	public void setTestNum(int testNum) {
		this.testNum = testNum;
	}
	public String getTestAnswers() {
		return testAnswers;
	}
	public void setTestAnswers(String testAnswers) {
		this.testAnswers = testAnswers;
	}
	public Timestamp getTestDate() {
		return testDate;
	}
	public void setTestDate(Timestamp testDate) {
		this.testDate = testDate;
	}
}
