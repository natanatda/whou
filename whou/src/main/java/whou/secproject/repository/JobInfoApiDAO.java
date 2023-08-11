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

import whou.secproject.component.JobInfoParamDTO;
import whou.secproject.component.JobTypeListResponseDTO;
import whou.secproject.component.JobDicDetailResponseDTO;
import whou.secproject.component.JobInfoListResponseDTO;

public class JobInfoApiDAO {
	
	@Autowired
	private String apiKey;
	
	public JobInfoListResponseDTO getJobInfoListSorted(String q) {
				
		String url = "https://www.career.go.kr/cnet/openapi/getOpenApi";
	    JobInfoParamDTO jParam = new JobInfoParamDTO();
	    jParam.setSvcType("api");
	    jParam.setSvcCode("JOB");
	    jParam.setContentType("json");
	    jParam.setGubun("job_dic_list");
	    jParam.setPgubn("100829");
	    jParam.setCategory("105106");
	    jParam.setThisPage("1");
	    jParam.setPerPage("9");
	    
	    URI uri = null;
		try {
			uri = UriComponentsBuilder.fromHttpUrl(url)
			        .queryParam("apiKey", URLEncoder.encode(apiKey, "UTF-8"))
			        .queryParam("svcType", URLEncoder.encode(jParam.getSvcType(), "UTF-8"))
			        .queryParam("svcCode", URLEncoder.encode(jParam.getSvcCode(), "UTF-8"))
			        .queryParam("contentType", URLEncoder.encode(jParam.getContentType(), "UTF-8"))
			        .queryParam("gubun", URLEncoder.encode(jParam.getGubun(), "UTF-8"))
			        .queryParam("pgubn", URLEncoder.encode(jParam.getPgubn(), "UTF-8"))
			        .queryParam("category", URLEncoder.encode(jParam.getPgubn(), "UTF-8"))
			        .queryParam("thisPage", URLEncoder.encode(jParam.getThisPage(), "UTF-8"))
			        .queryParam("perPage", URLEncoder.encode(jParam.getPerPage(), "UTF-8"))
			        .build(true)
			        .toUri();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
	    JobInfoListResponseDTO jobInfoResponse = null;
	    // 객체 byte 배열로 받은 후 utf처리
	    RestTemplate restTemplate = new RestTemplate();
	    ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
	    byte[] responseBodyBytes = response.getBody();
	    String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);

	    // 로깅을 활용한 디버깅
	    
	    try {
	        ObjectMapper objectMapper = new ObjectMapper();
	        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	        jobInfoResponse = objectMapper.readValue(responseBody, JobInfoListResponseDTO.class);
	        
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
			e.printStackTrace();
		}
	    return jobInfoResponse; 
	}
	public JobDicDetailResponseDTO getJobInfoDetail(String q) {
		
		String url = "https://www.career.go.kr/cnet/openapi/getOpenApi";
		JobInfoParamDTO jParam = new JobInfoParamDTO();
		jParam.setSvcType("api");
		jParam.setSvcCode("JOB_VIEW");
		jParam.setContentType("json");
		jParam.setGubun("job_dic_list");
		jParam.setJobdicSeq("120");
		
		URI uri = null;
		try {
			uri = UriComponentsBuilder.fromHttpUrl(url)
					.queryParam("apiKey", URLEncoder.encode(apiKey, "UTF-8"))
					.queryParam("svcType", URLEncoder.encode(jParam.getSvcType(), "UTF-8"))
					.queryParam("svcCode", URLEncoder.encode(jParam.getSvcCode(), "UTF-8"))
					.queryParam("contentType", URLEncoder.encode(jParam.getContentType(), "UTF-8"))
					.queryParam("gubun", URLEncoder.encode(jParam.getGubun(), "UTF-8"))
					.queryParam("jobdicSeq", URLEncoder.encode(jParam.getJobdicSeq(), "UTF-8"))
					.build(true)
					.toUri();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		JobDicDetailResponseDTO jobInfoResponse = null;
		// 객체 byte 배열로 받은 후 utf처리
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
		byte[] responseBodyBytes = response.getBody();
		String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);
		
		// 로깅을 활용한 디버깅
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			jobInfoResponse = objectMapper.readValue(responseBody, JobDicDetailResponseDTO.class);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException io) {
			io.printStackTrace();
		}
		return jobInfoResponse; 
	}
	public JobTypeListResponseDTO getJobTypeList() {
		
		String url = "https://www.career.go.kr/cnet/openapi/getOpenApi";
		JobInfoParamDTO jParam = new JobInfoParamDTO();
		jParam.setSvcType("api");
		jParam.setSvcCode("JOB_TYPE");
		jParam.setContentType("json");
		
		URI uri = null;
		try {
			uri = UriComponentsBuilder.fromHttpUrl(url)
					.queryParam("apiKey", URLEncoder.encode(apiKey, "UTF-8"))
					.queryParam("svcType", URLEncoder.encode(jParam.getSvcType(), "UTF-8"))
					.queryParam("svcCode", URLEncoder.encode(jParam.getSvcCode(), "UTF-8"))
					.queryParam("contentType", URLEncoder.encode(jParam.getContentType(), "UTF-8"))
					.build(true)
					.toUri();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		JobTypeListResponseDTO jobInfoResponse = null;
		// 객체 byte 배열로 받은 후 utf처리
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
		byte[] responseBodyBytes = response.getBody();
		String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);
		
		// 로깅을 활용한 디버깅
		
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			jobInfoResponse = objectMapper.readValue(responseBody, JobTypeListResponseDTO.class);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException io) {
			io.printStackTrace();
		}
		return jobInfoResponse; 
	}
}