package whou.secproject.repository;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
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

	
	public AptitudeTestResponseDTO getAptitudeTestByNum(String q) {
		String url = "http://www.career.go.kr/inspct/openapi/test/questions";
	    
	    URI uri = null;
		try {
			uri = UriComponentsBuilder.fromHttpUrl(url)
			        .queryParam("apikey", URLEncoder.encode(apiKey, "UTF-8"))
			        .queryParam("q", URLEncoder.encode(q, "UTF-8"))
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
	    System.out.println("API 응답: " + responseBody.substring(0,60));
	    
	    AptitudeTestResponseDTO aptitudeResponse = null;
	    try {
	        ObjectMapper objectMapper = new ObjectMapper();
	        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	        aptitudeResponse = objectMapper.readValue(responseBody, AptitudeTestResponseDTO.class);
	        
	        System.out.println("에러 이유"+aptitudeResponse.getERROR_REASON());
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
			e.printStackTrace();
		}
	    return aptitudeResponse; // 예제임 수정하셈
	}
	// 추가로 개인정보 dto 넣어줘야됨
	public AptitudeTestResultResponseDTO getAptitudeTestResult(List<String> answers, String qnum) {
	    AptitudeTestResultResponseDTO aptiTestResultResponse = null;
	    AptitudeTestResultRequestDTO atrr = new AptitudeTestResultRequestDTO();
	    
	    atrr.setQestrnSeq(qnum);
	    atrr.setTrgetSe("100206"); // 초등학생 등 타겟
	    atrr.setName("홍길동"); 
	    atrr.setGender("100323"); // 성별?
	    atrr.setSchool("율도 중학교"); // 
	    atrr.setGrade("2"); 
	    atrr.setEmail(""); 
	    atrr.setStartDtm(1550466291034L);
	    atrr.setAnswers("1=5 2=7 3=3 4=7 5=1 6=2 7=1 8=5 9=5 10=1 11=4 12=4 13=5 14=4 15=4 16=4 17=4 18=5 19=1 20=1 21=1 22=5 23=3 24=6 25=3 26=2 27=2 28=6 29=3 30=2 31=4 32=3 33=5 34=2 35=3 36=2 37=7 38=2 39=5 40=5 41=5 42=1 43=7 44=6 45=5 46=4 47=2 48=5 49=4 50=5 51=5 52=5 53=7 54=2 55=6 56=4 57=6 58=4 59=3 60=5 61=5 62=5 63=7 64=4 65=7 66=5");
	    StringBuilder answer = new StringBuilder();
	    for(int i = 0; i<answers.size(); i++)
	    	answer.append(i+1).append("=").append(answers.get(i)).append(" ");
	    answer.setLength(answer.length() - 1); 
	    
	    //atrr.setAnswers(answer.toString());
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
				System.out.println(line);
				response.append(line);
			}
			
			// 연결 해제
			connection.disconnect();
			
			// 응답 반환
			response.toString();
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

			aptiTestResultResponse = objectMapper.readValue(response.toString(), AptitudeTestResultResponseDTO.class);
			System.out.println(aptiTestResultResponse.getRESULT().getUrl());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aptiTestResultResponse;
	}
	
}