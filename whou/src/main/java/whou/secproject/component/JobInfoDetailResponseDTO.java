
package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobInfoDetailResponseDTO {
	
	@JsonProperty("dataSearch")
	private DataSearch dataSearch;

	@Data
	public static class DataSearch {
		@JsonProperty("content")
	    private List<JobDetail> content;
	}
	@Data
	public static class JobDetail {
		private String summary; // 전자장비설치 및 수리원은 환자모니
		private List<SchClass> SchClass;
		private String similarJob;
		private List<GenCD> GenCD;
		private List<Stateofemp> stateofemp;
	    private List<Prepareway> prepareway;
	    private List<Division> division;
	    private List<Capacity_major> capacity_major;
	    private List<LstHighAptd> lstHighAptd;
	    private List<LstVals> lstVals;
	    private List<Contact> contact;
	    private List<Job_possibility> job_possibility;
	    private String aptitude;
	    private String ability;
	    private String job;
	    private List<LstMiddleAptd> lstMiddleAptd;
	}
	@Data
	public static class SchClass{
		private List<SchPopular> popular; 
		private List<SchBook> bookmark; 
	}
	
	@Data
	public static class SchPopular{
		private String SCH_CLASS_NM; // 중학생(14~16세 청소년)
		private double PCNT; // 52.4
		private String PCNT1; // 52
		private String PCNT2; // 4
	}
	
	@Data
	public static class SchBook{
		private double PCNT; // 0.0
		private String PCNT1; // 0
		private String PCNT2; // 0
	}
	
	@Data
	public static class GenCD{
		
		private List<GenClass> GenPopular;
		private List<GenClass> GenBook;
	}
	
	@Data
	public static class GenClass{
		private String GenNM; // 남자
		private double PCNT; // 75.9
		private String PCNT1; // 75
		private String PCNT2; // 9
	}
	
	@Data
	public static class Stateofemp{
		private String empway; // 공채나 교육기관의 소개 등을 통해 의료장비
		private String employment; // 자장비설치 및 수리원의 종사자 수는 131,000명이며,
		private String salery; // "salery": "전자장비설치 및 수리원의 평균연봉(중위값)은 3075만원이다(자료: 워크넷 직업정보 2019년 7월 기준). 
	}
	
	@Data
	public static class Prepareway{
		private String preparation; // 고등학교 졸업 이상의 학력이 요구된다.
		private String training; // 직업전문학교나 기능대학에서 전자장비 설치 및
		private String certification; // 관련 국가자격증으로는 한국산업인력공단에서 시행하는 전자기사
	}
	
	@Data
	public static class Division{
		private String emplym_code_nm; // 8329기타 전기·전자 기기 설치·수리원
		private String std_code_nm; // 7619기타 전기·전자기기 설치 및 수리원
		private String cnet_job_dvs; // 공학분야(숙련직)
	}
	
	@Data
	public static class Capacity_major{
		private String capacity; // 전자산업기사, 전자기사
		private List<Major> major;
	}

	@Data
	public static class Major{
		private int RNUM; // 1
		private String MAJOR_NM; // 기계과
		private int MAJOR_SEQ; // 87
		private String CNTNTS_URL; // http://www.career.go.kr/cnet/front/base/major/FunivMajorView.do?SEQ=
		private int TOTAL_CNT; // 3
	}
	
	@Data
	public static class LstHighAptd{
		private List<LstHighAptdPop> popular;
		private List<LstHighAptdBook> book;
	}
	
	@Data
	public static class LstHighAptdPop{
		private String CD_ORDR; // 05
		private int RANK; // 1
		private String CD_NM; // 창의력
	}
	@Data
	public static class LstHighAptdBook{
	}
	@Data
	public static class LstVals{
		private List<LstValsPop> popular;
		private List<LstValsBook> book;
	}
	@Data
	public static class LstValsPop{
	}
	@Data
	public static class LstValsBook{
	}
	
	@Data
	public static class Contact{
	}
	
	@Data
	public static class Job_possibility{
		private List<Chart_item_list> chart_item_list;
		private String possiblity;
	}
	
	@Data
	public static class Chart_item_list{
		private double chart_value; // 8.00
		private String chart_key; // 보상
	}
	@Data
	public static class LstMiddleAptd{
		private List<LstMiddleAptdPop> popular;
		private List<LstMiddleAptdBook> book;
	}
	@Data
	public static class LstMiddleAptdPop{
	}
	@Data
	public static class LstMiddleAptdBook{
	}
}
