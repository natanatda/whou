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
		//전공 리스트
		@JsonProperty("lClass")
    	private String lClass;
        private String facilName;
        private String majorSeq;
        @JsonProperty("mClass")
        private String mClass;
        private String totalCount;
        
        @JsonProperty("lClass")
		public String getLClass() {
			return lClass;
		}
		@JsonProperty("lClass")
		public void setLClass(String lClass) {
			this.lClass = lClass;
		}
		@JsonProperty("mClass")
		public String getMClass() {
			return mClass;
		}
		@JsonProperty("mClass")
		public void setMClass(String mClass) {
			this.mClass = mClass;
		}
		
		
		
		// 전공 상세
		private String major;
	    private String salary;
	    private String employment;
	    private String department;
	    private String summary;
	    private String job;
	    private String qualifications;
	    private String interest;
	    @JsonProperty("enter_field")
	    private List<EnterFieldDTO> enterFields;
	    @JsonProperty("university")
	    private List<UniversityDTO> universities;
	    @JsonProperty("chartData")
	    private List<ChartDataDTO> chartData;
		
    }
	
	@Data
    public static class EnterFieldDTO {
		@JsonProperty("gradeuate")
        private String graduate;
        private String description;
    }
	
	@Data
    public static class UniversityDTO {
        private String area;
        private String schoolURL;
        @JsonProperty("campus_nm")
        private String campusName;
        private String majorName;
        private String schoolName;
        private String totalCount;
    }
	
	@Data
    public static class ChartDataDTO {
		@JsonProperty("field")
        private List<FieldDTO> fields;
		@JsonProperty("avg_salary")
        private List<SalaryDTO> avgSalary;
		@JsonProperty("applicant")
        private List<ApplicantDTO> applicants;
    }
	
	@Data
    public static class FieldDTO {
        private String item;
        private String data;
        private String name;
    }

	@Data
    public static class SalaryDTO {
        private String item;
        private String data;
        private String name;
    }

	@Data
    public static class ApplicantDTO {
        private String item;
        private String data;
        private String name;
    }
	
	
	
	
}
