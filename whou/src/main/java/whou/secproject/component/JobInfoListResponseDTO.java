package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobInfoListResponseDTO {
	
	@JsonProperty("dataSearch")
	private DataSearch dataSearch;

	@Data
	public static class DataSearch {
		@JsonProperty("content")
	    private List<Job> content;
	}
	@Data
	public static class Job {
		private String totalCount;
		private String job;
		private String jobdicSeq;
		private String profession;
		private String similarJob;
	    private String summary;
	    private String equalemployment;
	    private String possibility;
	    private String prospect;
	    private String salery;
	    private String job_code;
	    private String job_ctg_code;
	    private String aptd_type_code;
	}
}
