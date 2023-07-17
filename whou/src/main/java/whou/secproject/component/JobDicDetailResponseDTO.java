<<<<<<< HEAD
package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobDicDetailResponseDTO {
   
   @JsonProperty("workList")
   private List<Work> workList; // �ϴ���
   
   @JsonProperty("baseInfo")
   private BaseInfo baseInfo; //
   
   @JsonProperty("abilityList")
   private List<Ability> abilityList; // �ٽɴɷ�
   
   @JsonProperty("departList")
   private List<Depart> departList; // ���� �а�
   
   @JsonProperty("certiList")
   private List<Certi> certiList; // �ڰ���
   
   @JsonProperty("aptitudeList")
   private List<Aptitude> aptitudeList; // �ڰ���
   
   @JsonProperty("interestList")
   private List<Interest> interestList; // ���
   
   @JsonProperty("tagList")
   private List<String> Tag; // ���� �±�
   
   @JsonProperty("researchList")
   private List<Research> researchList; // ����Ž��Ȱ��
   
   @JsonProperty("relVideoList")
   private List<RelVideo> relVideo; // ���� ����
   
   @JsonProperty("relSolList")
   private List<RelSol> relSol; // ���� ���
   
   @JsonProperty("relJinSolList")
   private List<RelJinSol> relJinSol; // ���� ���� �ڷ�
   
   @JsonProperty("jobReadyList")
   private JobReady jobReady;
   
   @JsonProperty("jobRelOrgList")
   private List<JobRelOrg> jobRelOrg; // ���� ���
   
   @JsonProperty("forecastList")
   private List<Forecast> forecast; // ���� ����
   
   @JsonProperty("eduChart")
   private List<EduChart> eduChart; // �зº���
   
   @JsonProperty("majorChart")
   private List<MajorChart> majorChart; // ���� �迭
   
   @JsonProperty("indicatorChart")
   private List<IndicatorChart> indicatorChart; // ���� �迭
   
   @JsonProperty("performList")
   private Perform perform; // ���� �迭
   
   @Data
   public static class BaseInfo{
      private String aptit_name; // ���� �з�
      private String INTRST_YON_YN; // �������� ���� ����
      private String emp_job_nm; // ����ڵ��
      private String social; // ��ȸ ����
      private int emp_job_cd; // ��� �ڵ�
      private int job_cd; // ���� �ڵ�
      private double satisfication; // ���� ������
      private String rel_job_nm; // ���� ������
      private String job_nm; // ������
      private String std_job_nm; // ǥ������ �ڵ��
      private String wlb; // ����
      private String std_job_cd; // ǥ�������ڵ�
      private String wage_source; // ��տ��� ��ó
      private String edit_dt; // ������
      private String reg_dt; // �ۼ���
      private String satisfi_source; // ���������� ��ó
      private String tag; // �±�
      private int seq; // ���� ��ȣ
      private int views; // ��ȸ��
      private int likes; // ���ƿ�
      private String wage; // ��� ����
   }
   
   @Data
   public static class Work{
       private String work;
   }

   @Data
   public static class Ability{
      private String SORT_ORDR; // ���ļ���
      private String ability_name; // �ٽɴɷ�
   } 
   @Data
   public static class Depart{
      private String depart_id; // �����а� Id
      private String depart_name; // �����а� ��
   }
   
   @Data
   public static class Certi{
      private String certi; // ���� �ڰ���
      private String link; // ���� �ڰ��� link
   }
   
   @Data
   public static class Aptitude{
      private String aptitude; // ����
   }
   
   @Data
   public static class Interest{
      private String interest; // ���
   }
   
   @Data
   public static class Research{
      private String research; // ����Ž��Ȱ��
   }
   
   
   @Data
   public static class RelVideo{
      private String video_name; // ������ ����
      private String THUMNAIL_FILE_SER; // ����� ID
      private String job_cd; // �����ڵ�
      private String THUMNAIL_PATH; // ����� URL
      private String OUTPATH3; // ������ URL
      private String video_id; // ������ id
      private String CID; // ������ id
   }
   
   @Data
   public static class RelSol{
      private String TRGET_SE; // Ÿ����
      private String cnslt; // ���λ�� ����
      private String SJ; // ����
      private String CN; // ����
      private String REGIST_DT; // �����
      private int cnslt_seq; // ���� ���� ��� id
   }
   
   @Data
   public static class RelJinSol{
      private String SUBJECT; // ���� �ڷ��
      private String ALT; // ���� �ڷ�ID
      private String THUMBNAIL; // �����
      private String SEQ; // ������ȣ
   }
   
   @Data
   public static class JobReady{ //�غ� ���
      private List<Recruit> recruit; // ���� �� ������
      private List<Certificate> certificate; //���� �ڰ���
      private List<Training> training; //���� �Ʒ�
      private List<Curriculum> curriculum; // ���Ա�������
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
      private String rel_org; // ���ñ����
      private String rel_org_url; // ���ñ�� URL
   }
   
   @Data
   public static class Forecast{
      private String forecast; // ���� ����
   }
   @Data
   public static class EduChart{
      private String chart_name; // �зº���
      private String chart_data; // �зº��� ������
      private String source; // ��ó
   }
   
   @Data
   public static class MajorChart{ 
      private String major; // �����迭��
      private String major_data; // �����迭 ������
      private String source; // ��ó
   }
   
   @Data
   public static class IndicatorChart{
      private String indicator; //������ǥ��
      private String indicator_data; // ������ǥ������
      private String source; // ��ó
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
      private String environment; // ����ȯ�� �ɷ¸�
      private String inform; // ����
      private int importance; // �߿䵵
      private String source; // ��ó
   }
   
   @Data
   public static class Perform_{
      private String perform; // ��������ɷ� �ɷ¸�
      private String inform; // ����
      private int importance; // �߿䵵
      private String source; // ��ó
   }
   
   @Data
   public static class Knowledge{
      private String knowledge; // �����߿䵵 �ɷ¸�
      private String inform; // ���� 
      private int importance;//�߿䵵
      private String source; // ��ó
   }
   
}
=======
package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class JobDicDetailResponseDTO {
	
	@JsonProperty("baseInfo")
	private BaseInfo baseInfo; //
	
	@JsonProperty("workList")
	private List<Work> workList; // �ϴ���
	
	@JsonProperty("abilityList")
	private List<Ability> abilityList; // �ϴ���
	
	@JsonProperty("departList")
	private List<Depart> departList; // ���� �а�
	
	@JsonProperty("certiList")
	private List<Certi> certiList; // �ڰ���
	
	@JsonProperty("aptitudeList")
	private List<Aptitude> aptitudeList; // �ڰ���
	
	@JsonProperty("interestList")
	private List<Interest> interestList; // ���
	
	@JsonProperty("tageList")
	private List<String> Tag; // ���� �±�
	
	@JsonProperty("researchList")
	private List<Research> researchList; // ����Ž��Ȱ��
	
	@JsonProperty("relVideoList")
	private List<RelVideo> relVideo; // ���� ����
	
	@JsonProperty("relSolList")
	private List<RelSol> relSol; // ���� ���
	
	@JsonProperty("relJinSolList")
	private List<RelJinSol> relJinSol; // ���� ���� �ڷ�
	
	@JsonProperty("jobReadyList")
	private List<JobReady> jobReady;
	
	@JsonProperty("jobRelOrgList")
	private List<JobRelOrg> jobRelOrg; // ���� ���
	
	@JsonProperty("forecastList")
	private List<Forecast> forecast; // ���� ����
	
	@JsonProperty("eduChart")
	private List<EduChart> eduChart; // �зº���
	
	@JsonProperty("majorChart")
	private List<MajorChart> majorChart; // ���� �迭
	
	@JsonProperty("indicatorChart")
	private IndicatorChart indicatorChart; // ���� �迭
	
	@JsonProperty("performList")
	private List<Perform> perform; // ���� �迭
	
	@Data
	public static class BaseInfo{
		private String aptit_name; // ���� �з�
		private String INTRST_YON_YN; // �������� ���� ����
		private String emp_job_nm; // ����ڵ��
		private String social; // ��ȸ ����
		private int emp_job_cd; // ��� �ڵ�
		private int job_cd; // ���� �ڵ�
		private double satisfiction; // ���� ������
		private String rel_job_nm; // ���� ������
		private String job_nm; // ������
		private String std_job_nm; // ǥ������ �ڵ��
		private String wlb; // ����
		private String std_job_cd; // ǥ�������ڵ�
		private String wage_source; // ��տ��� ��ó
		private String edit_dt; // ������
		private String reg_dt; // �ۼ���
		private String satisfi_source; // ���������� ��ó
		private String tag; // �±�
		private int seq; // ���� ��ȣ
		private int views; // ��ȸ��
		private int likes; // ���ƿ�
		private int wage; // ��� ����
	}
	
	@Data
	public static class Work{
	    private String work;
	}

	@Data
	public static class Ability{
		private String SORT_ORDR; // ���ļ���
		private String ability_name; // �ٽɴɷ�
	} 
	@Data
	public static class Depart{
		private String depart_id; // �����а� Id
		private String depart_name; // �����а� ��
	}
	
	@Data
	public static class Certi{
		private String certi; // ���� �ڰ���
		private String LINK; // ���� �ڰ��� link
	}
	
	@Data
	public static class Aptitude{
		private String aptitude; // ����
	}
	
	@Data
	public static class Interest{
		private String interest; // ���
	}
	
	@Data
	public static class Research{
		private String research; // ����Ž��Ȱ��
	}
	
	
	@Data
	public static class RelVideo{
		private String video_name; // ������ ����
		private String THUMNAIL_FILE_SER; // ����� ID
		private String job_cd; // �����ڵ�
		private String THUMNAIL_PATH; // ����� URL
		private String OUTPATH3; // ������ URL
		private String video_id; // ������ id
		private String CID; // ������ id
	}
	
	@Data
	public static class RelSol{
		private String TRGET_SE; // Ÿ����
		private String cnslt; // ���λ�� ����
		private String SJ; // ����
		private String CN; // ����
		private String REGIST_DT; // �����
		private int cnslt_seq; // ���� ���� ��� id
	}
	
	@Data
	public static class RelJinSol{
		private String SUBJECT; // ���� �ڷ��
		private String ALT; // ���� �ڷ�ID
		private String THUMBNAIL; // �����
		private int SEQ; // ������ȣ
	}
	
	@Data
	public static class JobReady{
		private List<Recruit> recruit; // ���� �� ������
		private List<Certificate> certificate; //���� �ڰ���
		private List<Training> training; //���� �Ʒ�
		private List<Curriculum> curriculum; // ���汳������
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
		private String rel_org; // ���ñ����
		private String rel_org_url; // ���ñ�� URL
	}
	
	@Data
	public static class Forecast{
		private String forcast; // ���� ����
	}
	@Data
	public static class EduChart{
		private String chart_name; // �зº���
		private String chart_data; // �зº��� ������
		private String source; // ��ó
	}
	
	@Data
	public static class MajorChart{ 
		private String major; // �����迭��
		private String major_data; // �����迭 ������
		private String source; // ��ó
	}
	
	@Data
	public static class IndicatorChart{
		private String indicator; //������ǥ��
		private String indicator_data; // ������ǥ������
		private String source; // ��ó
	}
	@Data
	public static class Perform{
		private List<Environment> environment; 
		private List<Perform_> perform_;
		private List<Knowledge> knowledge;
	}
	
	@Data
	public static class Environment{
		private String environment; // ����ȯ�� �ɷ¸�
		private String inform; // ����
		private int importance; // �߿䵵
	}
	
	@Data
	public static class Perform_{
		private String perform; // ��������ɷ� �ɷ¸�
		private String inform; // ����
		private String importance; // �߿䵵
	}
	
	@Data
	public static class Knowledge{
		private String knowledge; // �����߿䵵 �ɷ¸�
		private String inform; // ���� 
		private String importance;//�߿䵵
	}
	
}
>>>>>>> user
