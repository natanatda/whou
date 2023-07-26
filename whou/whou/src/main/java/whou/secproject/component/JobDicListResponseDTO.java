package whou.secproject.component;

import java.util.List; 

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobDicListResponseDTO {
	
	@JsonProperty("count")
	private int count;
	
	@JsonProperty("pageSize")
	private int pageSize;
	
	@JsonProperty("pageIndex")
	private int pageIndex;

	@JsonProperty("jobs")
	private List<Jobs> jobs;
	
	@Data
	public static class Jobs {
		private String aptit_name; // 직업군
		private String social; // 사회적 기여 
		private String work; // 하는 일
		private int job_cd; // 직업 코드
		private String rel_job_nm; // 관련 직업
	    private String job_nm; // 직업명
	    private String top_nm; // 수정일
	    private String wlb; // 워라벨
	    private double RNUM; // rownum
	    private String edit_dt; // 수정일
	    private String reg_dt; // 등록일
	    private int seq; // 고유번호
	    private int views; // 조회수
	    private int likes; // 추천수
	    private String wage; // 연봉 수준
	}
}
