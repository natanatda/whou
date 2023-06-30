package whou.secproject.component;


import java.util.List; 

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobTypeListResponseDTO {

	@JsonProperty("dataSearch")
	private DataSearch dataSearch;

	@Data
	public static class DataSearch {
		@JsonProperty("content")
	    private List<JbgpCode> content;
	}
	
	@Data
	public static class JbgpCode {
	    private String jbgp_code;
	    private String jbgp_code_nm;
	}
}


