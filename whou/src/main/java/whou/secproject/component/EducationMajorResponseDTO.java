package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class EducationMajorResponseDTO {
	
	@JsonProperty("dataSearch")
	private DataSearch dataSearch;
	
	@Data
	public static class DataSearch{
		@JsonProperty("content")
		private List<MajorInfo> content;
	}
	
    @Data
    public static class MajorInfo{
    	private String lClass;
        private String facilName;
        private String majorSeq;
        private String mClass;
        private String totalCount;
    }
}
