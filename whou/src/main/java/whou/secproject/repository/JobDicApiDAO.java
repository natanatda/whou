package whou.secproject.repository;

import java.io.IOException; 
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import whou.secproject.component.JobDicListResponseDTO;
import whou.secproject.component.JobDicParamDTO;

public class JobDicApiDAO {
	
	@Autowired
	private String apiKey;
	String url = "https://www.career.go.kr/cnet/front/openapi/jobs.json";
	
	public JobDicListResponseDTO getJobDicListSorted(JobDicParamDTO jParam) {  
				
	    jParam.setPageIndex("1");
	    // jParam.setPageIndex(pageNum);
	    jParam.setSearchAptdCodes(new String [] {"104740"});
	    jParam.setSearchJobNm("");

	    URI uri = null;
	    try {
	        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url)
	                .queryParam("apiKey", URLEncoder.encode(apiKey, "UTF-8"));

	        if (jParam.getPageIndex() != null) 
	            builder.queryParam("perIndex", URLEncoder.encode(jParam.getPageIndex(), "UTF-8"));
	        if (jParam.getSearchJobNm() != null) 
	        	builder.queryParam("searchJobNm", URLEncoder.encode(jParam.getSearchJobNm(), "UTF-8"));
	        if (jParam.getSearchThemeCode() != null) 
	        	builder.queryParam("searchJobNm", URLEncoder.encode(jParam.getSearchThemeCode(), "UTF-8"));
	        if (jParam.getSearchAptdCodes() != null) 
	        	builder.queryParam("searchAptdCodes", URLEncoder.encode(String.join(",", jParam.getSearchAptdCodes()), "UTF-8"));
	        if (jParam.getSearchJobCd() != null) 
	        	builder.queryParam("searchJobCd", URLEncoder.encode(jParam.getSearchJobCd(), "UTF-8"));
	        uri = builder.build(true).toUri();
	        
	    } catch (UnsupportedEncodingException e1) {
	        e1.printStackTrace();
	    }

		
	    JobDicListResponseDTO jobDicResponse = null;
	    
	    // ��ü byte �迭�� ���� �� utfó��
	    RestTemplate restTemplate = new RestTemplate();
	    ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
	    byte[] responseBodyBytes = response.getBody();
	    String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);

	    // �α��� Ȱ���� �����
	    System.out.println("API ����: " + responseBody.substring(0,60));
	    
	    try {
	        ObjectMapper objectMapper = new ObjectMapper();
	        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	        jobDicResponse = objectMapper.readValue(responseBody, JobDicListResponseDTO.class);
	        
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
			e.printStackTrace();
		}
	    return jobDicResponse; 
	}
	public JobDicListResponseDTO getJobDicDetail(int seq) {  
		
		URI uri = null;
		try {
			uri = UriComponentsBuilder.fromHttpUrl(url)
					.queryParam("apiKey", URLEncoder.encode(apiKey, "UTF-8"))
					.queryParam("seq", URLEncoder.encode(String.valueOf(seq), "UTF-8"))
					.build(true)
					.toUri();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		JobDicListResponseDTO jobDicResponse = null;
		
		// ��ü byte �迭�� ���� �� utfó��
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
		byte[] responseBodyBytes = response.getBody();
		String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);
		
		// �α��� Ȱ���� �����
		System.out.println("API ����: " + responseBody.substring(0,60));
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			jobDicResponse = objectMapper.readValue(responseBody, JobDicListResponseDTO.class);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jobDicResponse; 
	}
}
