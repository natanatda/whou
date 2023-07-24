package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobDicDetailResponseDTO {
   
   @JsonProperty("workList")
   private List<Work> workList; // 하는일
   
   @JsonProperty("baseInfo")
   private BaseInfo baseInfo; //
   
   @JsonProperty("abilityList")
   private List<Ability> abilityList; // 핵심능력
   
   @JsonProperty("departList")
   private List<Depart> departList; // 관련 학과
   
   @JsonProperty("certiList")
   private List<Certi> certiList; // 자격증
   
   @JsonProperty("aptitudeList")
   private List<Aptitude> aptitudeList; // 자격증
   
   @JsonProperty("interestList")
   private List<Interest> interestList; // 흥미
   
   @JsonProperty("tagList")
   private List<String> Tag; // 관련 태그
   
   @JsonProperty("researchList")
   private List<Research> researchList; // 진로탐색활동
   
   @JsonProperty("relVideoList")
   private List<RelVideo> relVideo; // 비디오 관련
   
   @JsonProperty("relSolList")
   private List<RelSol> relSol; // 진로 상담
   
   @JsonProperty("relJinSolList")
   private List<RelJinSol> relJinSol; // 진로 관련 자료
   
   @JsonProperty("jobReadyList")
   private JobReady jobReady;
   
   @JsonProperty("jobRelOrgList")
   private List<JobRelOrg> jobRelOrg; // 관련 기관
   
   @JsonProperty("forecastList")
   private List<Forecast> forecast; // 직업 전망
   
   @JsonProperty("eduChart")
   private List<EduChart> eduChart; // 학력분포
   
   @JsonProperty("majorChart")
   private List<MajorChart> majorChart; // 전공 계열
   
   @JsonProperty("indicatorChart")
   private List<IndicatorChart> indicatorChart; // 전공 계열
   
   @JsonProperty("performList")
   private Perform perform; // 전공 계열
   
   @Data
   public static class BaseInfo{
      private String aptit_name; // 직업 분류
      private String INTRST_YON_YN; // 관심직업 설정 여부
      private String emp_job_nm; // 고용코드명
      private String social; // 사회 공헌
      private int emp_job_cd; // 고용 코드
      private int job_cd; // 직업 코드
      private double satisfication; // 직업 만족도
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
      private String wage; // 평균 연봉
   }
   
   @Data
   public static class Work{
       private String work;
   }

   @Data
   public static class Ability{
      private String SORT_ORDR; // 정렬순서
      private String ability_name; // 핵심능력
   } 
   @Data
   public static class Depart{
      private String depart_id; // 관련학과 Id
      private String depart_name; // 관련학과 명
   }
   
   @Data
   public static class Certi{
      private String certi; // 관련 자격증
      private String link; // 관련 자격증 link
   }
   
   @Data
   public static class Aptitude{
      private String aptitude; // 적성
   }
   
   @Data
   public static class Interest{
      private String interest; // 흥미
   }
   
   @Data
   public static class Research{
      private String research; // 진로탐색활동
   }
   
   
   @Data
   public static class RelVideo{
      private String video_name; // 동영상 제목
      private String THUMNAIL_FILE_SER; // 썸네일 ID
      private String job_cd; // 직업코드
      private String THUMNAIL_PATH; // 썸네일 URL
      private String OUTPATH3; // 동영상 URL
      private String video_id; // 동영상 id
      private String CID; // 콘텐츠 id
   }
   
   @Data
   public static class RelSol{
      private String TRGET_SE; // 타겟층
      private String cnslt; // 진로상담 내용
      private String SJ; // 제목
      private String CN; // 내용
      private String REGIST_DT; // 등록일
      private int cnslt_seq; // 관련 진로 상담 id
   }
   
   @Data
   public static class RelJinSol{
      private String SUBJECT; // 관련 자료명
      private String ALT; // 관련 자료ID
      private String THUMBNAIL; // 썸네일
      private String SEQ; // 고유번호
   }
   
   @Data
   public static class JobReady{ //준비 방법
      private List<Recruit> recruit; // 입직 및 취업방법
      private List<Certificate> certificate; //관련 자격증
      private List<Training> training; //직업 훈련
      private List<Curriculum> curriculum; // 정규교육과정
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
   public static class JobRelOrg{
      private String rel_org; // 관련기관명
      private String rel_org_url; // 관련기관 URL
   }
   
   @Data
   public static class Forecast{
      private String forecast; // 직업 전망
   }
   @Data
   public static class EduChart{
      private String chart_name; // 학력분포
      private String chart_data; // 학력분포 데이터
      private String source; // 출처
   }
   
   @Data
   public static class MajorChart{ 
      private String major; // 전공계열명
      private String major_data; // 전공계열 데이터
      private String source; // 출처
   }
   
   @Data
   public static class IndicatorChart{
      private String indicator; //직업지표명
      private String indicator_data; // 직업지표데이터
      private String source; // 출처
   }
   @Data
   public static class Perform{
      private List<Environment> environment; 
      @JsonProperty("perform")
      private List<Perform_> perform_;
      private List<Knowledge> knowledge;
   }
   
   @Data
   public static class Environment{
      private String environment; // 업무환경 능력명
      private String inform; // 설명
      private int importance; // 중요도
      private String source; // 출처
   }
   
   @Data
   public static class Perform_{
      private String perform; // 업무수행능력 능력명
      private String inform; // 설명
      private int importance; // 중요도
      private String source; // 출처
   }
   
   @Data
   public static class Knowledge{
      private String knowledge; // 지식중요도 능력명
      private String inform; // 설명 
      private int importance;//중요도
      private String source; // 출처
   }
   
}