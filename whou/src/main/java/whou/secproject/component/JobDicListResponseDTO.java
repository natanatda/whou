package whou.secproject.component;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import whou.secproject.service.JobDicService;

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
		
		
		private String aptit_name; // ������
		private String social; // ��ȸ�� �⿩ 
		private String work; // �ϴ� ��
		private int job_cd; // ���� �ڵ�
		private String rel_job_nm; // ���� ����
	    private String job_nm; // ������
	    private String top_nm; // ������
	    private String wlb; // ����
	    private double RNUM; // rownum
	    private String edit_dt; // ������
	    private String reg_dt; // �����
	    private int seq; // ������ȣ
	    private int views; // ��ȸ��
	    private int likes; // ��õ��
	    private String wage; // ���� ����
	    private String img;
	    private String backColor;
	}
}
