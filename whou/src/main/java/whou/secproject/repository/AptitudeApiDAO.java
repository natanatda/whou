package whou.secproject.repository;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import whou.secproject.component.AptitudeTestResponseDTO;
import whou.secproject.component.AptitudeTestResultRequestDTO;
import whou.secproject.component.AptitudeTestResultResponseDTO;

public class AptitudeApiDAO {
	
	@Autowired
	private String apiKey;
	
	public AptitudeTestResponseDTO getAptitudeTestByNum(String qnum) {
		String url = "http://www.career.go.kr/inspct/openapi/test/questions";
//	    aptitudeParam.setQ(qnum); //검사 번호 역량27 가치관6 흥미31 적성21
	    
	    URI uri = null;
		try {
			uri = UriComponentsBuilder.fromHttpUrl(url)
			        .queryParam("apikey", URLEncoder.encode(apiKey, "UTF-8"))
			        .queryParam("q", URLEncoder.encode(qnum, "UTF-8"))
			        .build(true)
			        .toUri();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	    
	    // 객체 byte 배열로 받은 후 utf처리
	    RestTemplate restTemplate = new RestTemplate();
	    ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
	    byte[] responseBodyBytes = response.getBody();
	    String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);

	    // 로깅을 활용한 디버깅
	    
	    AptitudeTestResponseDTO aptitudeResponse = null;
	    try {
	        ObjectMapper objectMapper = new ObjectMapper();
	        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	        aptitudeResponse = objectMapper.readValue(responseBody, AptitudeTestResponseDTO.class);
	        
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    }
	    return aptitudeResponse; // 예제임 수정하셈
	}
	
	

	public AptitudeTestResultResponseDTO getAptitudeTestResult(List<String>answers, String qnum) {
	    AptitudeTestResultResponseDTO aptiTestResultResponse = null;
	    AptitudeTestResultRequestDTO atrr = new AptitudeTestResultRequestDTO();
	    

	    atrr.setQestrnSeq(qnum);
	    atrr.setTrgetSe("100207"); 
	    atrr.setName("홍길동"); 
	    atrr.setGender("100323");
	    atrr.setSchool("율도 중학교");
	    atrr.setGrade("2"); 
	    atrr.setEmail(""); 
	    atrr.setStartDtm(1550466291034L);
	    StringBuilder answer = new StringBuilder();
	    for(int i = 0; i<answers.size(); i++)
	    	answer.append(i+1).append("=").append(answers.get(i)).append(" ");
	    answer.setLength(answer.length() - 1); 
	    atrr.setAnswers(answer.toString());
	    
		try {
			URL url = new URL("http://www.career.go.kr/inspct/openapi/test/report");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			connection.setDoOutput(true);
	
			StringBuilder jsonInputBuilder = new StringBuilder();
			jsonInputBuilder.append("{")
	        .append("\"apikey\": \"").append(apiKey).append("\", ")
	        .append("\"qestrnSeq\": \"").append(atrr.getQestrnSeq()).append("\", ")
	        .append("\"trgetSe\": \"").append(atrr.getTrgetSe()).append("\", ")
	        .append("\"name\": \"").append(atrr.getName()).append("\", ")
	        .append("\"gender\": \"").append(atrr.getGender()).append("\", ")
	        .append("\"school\": \"").append(atrr.getSchool()).append("\", ")
	        .append("\"grade\": \"").append(atrr.getGrade()).append("\", ")
	        .append("\"email\": \"").append(atrr.getEmail()).append("\", ")
	        .append("\"startDtm\": ").append(atrr.getStartDtm()).append(", ")
	        .append("\"answers\": \"").append(atrr.getAnswers()).append("\"")
	        .append("}");
	
			String jsonInputString = jsonInputBuilder.toString();
	    
			// 요청 데이터 전송
			DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream()); 
			byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
			outputStream.write(input, 0, input.length);
	
			// 응답 데이터 읽기
			StringBuilder response = new StringBuilder();
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8)); 
			String line;
			while ((line = reader.readLine()) != null) {
				response.append(line);
			}
			
			// 연결 해제
			connection.disconnect();
			
			// 응답 반환
			response.toString();
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			
			aptiTestResultResponse = objectMapper.readValue(response.toString(), AptitudeTestResultResponseDTO.class);
			//https://www.career.go.kr/inspct/web/psycho/able/report?seq=NjMzODQxNDA
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aptiTestResultResponse;
	}
}
