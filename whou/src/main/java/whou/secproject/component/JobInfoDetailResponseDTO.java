
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
		private String aptit_name; // 직업 분류
		private String INTRST_YON_YN; // 관심직업 설정 여부
		private String emp_job_nm; // 고용코드명
		private String social; // 사회 공헌
		private int emp_job_cd; // 고용 코드
	    private int job_cd; // 직업 코드
	    private double satisfiction; // 직업 만족도
	    private String rel_job_nm; // 관련 직업명
	    private String job_nm; // 직업명
	    private String std_job_nm; // 표준직업 코드명
	    private String wlb; // 워라벨
	    private String std_job_cd; // 표준직업코드
	    private String wage_source; // 평균연봉 출처
	    private String edit_dt; // 수정일
	    private String reg_dt; // 작성일
	    private String satisfi_source; // 직업만족도 출처
	    private String tag; // 태그
	    private int seq; // 직업 번호
	    private int views; // 조회수
	    private int likes; // 좋아요
	    private int wage; // 평균 연봉
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
