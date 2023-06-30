package whou.secproject.component;


import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AptitudeTestResultResponseDTO {

	@JsonProperty("SUCC_YN")
	private String SUCC_YN;
	
	@JsonProperty("ERROR_REASON")
	private String ERROR_REASON;
	
	@JsonProperty("RESULT")
	private ResultItem RESULT;
	
	// Getters and Setters
	@Data
	public static class ResultItem {
		private String inspctSeq;
		private String url;
	}
}


