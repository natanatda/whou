
package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobInfoDetailResponseDTO {
	
	@JsonProperty("workList")
	private List<Work> workList;
	
	@JsonProperty("interestList")
	private List<Interest> interestList;
	
	@JsonProperty("researchList")
	private List<Interest> researchList;
	
	@JsonProperty("baseInfo")
	private BaseInfo baseInfo;
	
	@JsonProperty("jobReadyList")
	private Recruit recruit;

	@Data
	public static class Work{
	    private String work;
	}
	
	@Data
	public static class Interest{
		private String interest;
	}
	@Data
	public static class BaseInfo{
		private String aptit_name; // ���� �з�
		private String INTRST_YON_YN; // �������� ���� ����
		private String emp_job_nm; // ����ڵ��
		private String social; // ��ȸ ����
		private int emp_job_cd; // ��� �ڵ�
	    private int job_cd; // ���� �ڵ�
	    private double satisfiction; // ���� ������
	    private String rel_job_nm; // ���� ������
	    private String job_nm; // ������
	    private String std_job_nm; // ǥ������ �ڵ��
	    private String wlb; // ����
	    private String std_job_cd; // ǥ�������ڵ�
	    private String wage_source; // ��տ��� ��ó
	    private String edit_dt; // ������
	    private String reg_dt; // �ۼ���
	    private String satisfi_source; // ���������� ��ó
	    private String tag; // �±�
	    private int seq; // ���� ��ȣ
	    private int views; // ��ȸ��
	    private int likes; // ���ƿ�
	    private int wage; // ��� ����
	}
	@Data
	public static class Recruit{
		private String recruit;
	}
	@Data
	public static class Certificate{
		private String certificate;
	}
	@Data
	public static class Training{
		private String training;
	}
	@Data
	public static class Curriculum{
		private String curriculum;
	}
	@Data
	public static class Forecast{
		private String forcast;
	}
	@Data
	public static class EduChart{
		private String chart_name;
		private String chart_data;
		private String source;
	}
	@Data
	public static class PerformList{
		private String environment;
		private String chart_data;
		private String source;
	}
}
