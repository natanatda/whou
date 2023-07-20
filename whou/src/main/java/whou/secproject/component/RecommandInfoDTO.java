package whou.secproject.component;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RecommandInfoDTO {

	private String interest_name1;
	private String interest_name2;
	private String interest_name3;
	private String interest_job1;
	private String interest_job2;
	private String interest_job3;
	private String aptitude_name1;
	private String aptitude_name2;
	private String aptitude_name3;
	private String aptitude_job1;
	private String aptitude_job2;
	private String aptitude_job3;
	private String values_score;
	private String aptitude_score;
	private String interest_score;
	private String abc3;
	private String abc4;
	private String abc5;
	private String abc6;
	private ArrayList<String> interest_jobs = new ArrayList<String>();
	private ArrayList<String> aptitude_jobs = new ArrayList<String>();
	
	public void setInterest_job1(String interest_job1) {
		this.interest_job1 = interest_job1;
		if(interest_job1!=null) interest_jobs.add(interest_job1);
	}
	public void setInterest_job2(String interest_job2) {
		this.interest_job2 = interest_job2;
		if(interest_job2!=null) interest_jobs.add(interest_job2);
	}
	public void setInterest_job3(String interest_job3) {
		this.interest_job3 = interest_job3;
		if(interest_job3!=null) interest_jobs.add(interest_job3);
	}
	public void setAptitude_job1(String aptitude_job1) {
		this.aptitude_job1 = aptitude_job1;
		if(aptitude_job1!=null) aptitude_jobs.add(aptitude_job1);
	}
	public void setAptitude_job2(String aptitude_job2) {
		this.aptitude_job2 = aptitude_job2;
		if(aptitude_job2!=null) aptitude_jobs.add(aptitude_job2);
	}
	public void setAptitude_job3(String aptitude_job3) {
		this.aptitude_job3 = aptitude_job3;
		if(aptitude_job3!=null) aptitude_jobs.add(aptitude_job3);
	}
	
	
}
