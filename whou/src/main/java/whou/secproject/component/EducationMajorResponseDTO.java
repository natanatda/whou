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
	    private List<CareerActivityDTO> careerActivities;
	    private String job;
	    private String qualifications;
	    private String interest;
	    private String property;
	    private List<EnterFieldDTO> enterFields;
	    private List<MainSubjectDTO> mainSubjects;
	    private List<UniversityDTO> universities;
	    private List<ChartDataDTO> chartData;
		
    }
	
	@Data
	public static class CareerActivityDTO {
        private String actName;
        private String actDescription;
    }

	@Data
    public static class EnterFieldDTO {
        private String graduate;
        private String description;
    }

	@Data
    public static class MainSubjectDTO {
        private String subjectName;
        private String subjectSummary;

        // 생성자, getter 및 setter 생략
    }
	
	@Data
    public static class UniversityDTO {
        private String area;
        private String schoolURL;
        private String campusName;
        private String majorName;
        private String schoolName;
        private String totalCount;
    }
	
	@Data
    public static class ChartDataDTO {
        private List<FieldDTO> fields;
        private List<SalaryDTO> avgSalary;
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
