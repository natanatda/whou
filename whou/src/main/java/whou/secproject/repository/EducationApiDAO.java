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
import com.fasterxml.jackson.databind.PropertyNamingStrategy;

import whou.secproject.component.EducationApiParamDTO;
import whou.secproject.component.EducationMajorResponseDTO;

public class EducationApiDAO {
	
	@Autowired
	private String apiKey;
	
	//커리어넷 학과 리스트 API
	public EducationMajorResponseDTO getMajorApi(EducationApiParamDTO majorParam) {
		String url = "https://www.career.go.kr/cnet/openapi/getOpenApi.json";
	    
	    URI uri = null;
		try {
			String svcCode = "MAJOR";
			if(majorParam.getMajorSeq() != null)
				svcCode="MAJOR_VIEW";
			
			UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url)
					.queryParam("apiKey", URLEncoder.encode(apiKey, "UTF-8"))
			        .queryParam("svcType", URLEncoder.encode("api", "UTF-8"))
			        .queryParam("svcCode", URLEncoder.encode(svcCode, "UTF-8"))
			        .queryParam("contentType", URLEncoder.encode("json", "UTF-8"))
					.queryParam("gubun", URLEncoder.encode("univ_list", "UTF-8"));
			
			if (majorParam.getUnivSe() != null) 
	            builder.queryParam("univSe", URLEncoder.encode(majorParam.getUnivSe(), "UTF-8"));
	        if (majorParam.getSubject() != null) 
	        	builder.queryParam("subject", URLEncoder.encode(majorParam.getSubject(), "UTF-8"));
	        if (majorParam.getThisPage() != null) 
	        	builder.queryParam("thisPage", URLEncoder.encode(majorParam.getThisPage(), "UTF-8"));
	        if (majorParam.getPerPage() != null) 
	        	builder.queryParam("perPage", URLEncoder.encode(majorParam.getPerPage(), "UTF-8"));
	        if (majorParam.getSearchTitle() != null) 
	        	builder.queryParam("searchTitle", URLEncoder.encode(majorParam.getSearchTitle(), "UTF-8"));
	        if (majorParam.getMajorSeq() != null) 
	        	builder.queryParam("majorSeq", URLEncoder.encode(majorParam.getMajorSeq(), "UTF-8"));
						
			uri = builder.build(true).toUri();
			System.out.println(uri);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	    
	    // 객체 byte 배열로 받은 후 utf처리
	    RestTemplate restTemplate = new RestTemplate();
	    ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
	    byte[] responseBodyBytes = response.getBody();
	    String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);

	    // 로깅을 활용한 디버깅
    	System.out.println("API 응답: " + responseBody.substring(0,60));
	    
	    EducationMajorResponseDTO educationMajorResponseDTO = null;
	    try {
	        ObjectMapper objectMapper = new ObjectMapper();
	        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	        System.out.println("DeserializationFeature 했다! "+objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false));
	        educationMajorResponseDTO = objectMapper.readValue(responseBody, EducationMajorResponseDTO.class);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
			e.printStackTrace();
		}
	    return educationMajorResponseDTO;
	}
}
