package whou.secproject.repository;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import whou.secproject.component.EducationApiParamDTO;
import whou.secproject.component.EducationHrdParamDTO;
import whou.secproject.component.EducationHrdResponseDTO;
import whou.secproject.component.EducationMajorResponseDTO;

public class EducationApiDAO {
	
	@Autowired
	private String apiKey;
	
	@Autowired
	private String authKey;
	
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
	
	
	
	
	//hrdnet 학과 리스트 API
	public List<EducationHrdResponseDTO> getHrdApi(String param, EducationHrdParamDTO hrdParam) {
		String url = null;
		if(param != null) {
			url = getHrdURL(param, hrdParam);
		}
		System.out.println("xml파싱 유알앨 "+url);

		List<EducationHrdResponseDTO> educationHrdResponseList = null;
		try {
			// HTTP 요청 보내기
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("GET");

            // 응답 코드 확인
			int responseCode = conn.getResponseCode();

			if (responseCode == HttpURLConnection.HTTP_OK) {
				// 응답 데이터 읽기
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
				StringBuilder response = new StringBuilder();
				String line;
				while ((line = reader.readLine()) != null) {
					response.append(line);
				}

				// 응답 데이터를 XML로 파싱
				String xmlData = response.toString();
				System.out.println("XML 데이터: " + xmlData.substring(0, 60));

				// XML 파서 설정
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				ByteArrayInputStream input = new ByteArrayInputStream(xmlData.getBytes(StandardCharsets.UTF_8));
				Document document = builder.parse(input);
				
				// "response" 엘리먼트 아래의 "HRDNet" 엘리먼트를 찾습니다.
				Element responseElement = document.getDocumentElement();
				Element hrdnetElement = (Element) responseElement.getElementsByTagName("HRDNet").item(0);
				System.out.println("aaaaa 되냐 aaaaa? "+hrdnetElement);
				
				// "hrdnetElement" 엘리먼트 아래의 "srchList" 엘리먼트를 찾습니다.
				Element srchListElement = (Element) hrdnetElement.getElementsByTagName("srchList").item(0);
				
				// "srchList" 엘리먼트 아래의 모든 "scn_list" 엘리먼트를 찾습니다.
				NodeList scnListNodeList = srchListElement.getElementsByTagName("scn_list");
				
				for (int i = 0; i < ((NodeList) srchListElement).getLength(); i++) {
					Node itemNode = scnListNodeList.item(i);
					if (itemNode.getNodeType() == Node.ELEMENT_NODE) {
						Element itemElement = (Element) itemNode;
						
						// "item" 엘리먼트에서 필요한 데이터를 추출합니다.
						String address = getElementValue((Element)scnListNodeList, "address");
						String subTitle = getElementValue((Element)scnListNodeList, "subTitle");
						String title = getElementValue((Element)scnListNodeList, "title");
						String titleLink = getElementValue((Element)scnListNodeList, "titleLink");
						String traStartDate = getElementValue((Element)scnListNodeList, "traStartDate");
						String traEndDate = getElementValue((Element)scnListNodeList, "traEndDate");
						
						// Festival 객체를 생성하고 리스트에 추가합니다.
						EducationHrdResponseDTO educationHrdResponseDTO = new EducationHrdResponseDTO();
						educationHrdResponseDTO.setAddress(url);
						educationHrdResponseDTO.setSubTitle(subTitle);
						educationHrdResponseDTO.setSubTitle(subTitle);
						educationHrdResponseDTO.setTitle(title);
						educationHrdResponseDTO.setTraStartDate(traStartDate);;
						educationHrdResponseDTO.setTraEndDate(traEndDate);
						
						educationHrdResponseList.add(educationHrdResponseDTO);
					}
				}
				
			}
            
            

		} catch (Exception e) {
			e.printStackTrace();
		}

		return educationHrdResponseList;
	}
	
	
	//HRD-net URL 처리
	public String getHrdURL(String param, EducationHrdParamDTO dto) {
	    String url = "https://www.hrd.go.kr/jsp/HRDP/HRDPO00/"+param;
	    
	    URI uri = null;
		try {
			UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(url)
					.queryParam("authKey", URLEncoder.encode(authKey, "UTF-8"))
			        .queryParam("returnType", URLEncoder.encode("XML", "UTF-8"))
			        .queryParam("pageSize", URLEncoder.encode("20", "UTF-8"))
			        .queryParam("sortCol", URLEncoder.encode("TRNG_BGDE", "UTF-8"))
					.queryParam("outType", URLEncoder.encode("1", "UTF-8"));
			
			if (dto.getSrchNcs1() != null) 
				builder.queryParam("srchNcs1", URLEncoder.encode(dto.getSrchNcs1(), "UTF-8"));
			if (dto.getSrchKeco1() != null) 
				builder.queryParam("srchKeco1", URLEncoder.encode(dto.getSrchKeco1(), "UTF-8"));
			if (dto.getSrchTraOrganNm() != null) 
	            builder.queryParam("srchTraOrganNm", URLEncoder.encode(dto.getSrchTraOrganNm(), "UTF-8"));
	        if (dto.getSrchTraProcessNm() != null) 
	        	builder.queryParam("srchTraProcessNm", URLEncoder.encode(dto.getSrchTraProcessNm(), "UTF-8"));
	        if (dto.getSrchTraStDt() != null) 
	        	builder.queryParam("srchTraStDt", URLEncoder.encode(dto.getSrchTraStDt(), "UTF-8"));
	        if (dto.getSrchTraEndDt() != null) 
	        	builder.queryParam("srchTraEndDt", URLEncoder.encode(dto.getSrchTraEndDt(), "UTF-8"));
	        if (dto.getPageNum() != null) 
	        	builder.queryParam("pageNum", URLEncoder.encode(dto.getPageNum(), "UTF-8"));
	        if (dto.getSort() != null) 
	        	builder.queryParam("sort", URLEncoder.encode(dto.getSort(), "UTF-8"));
	        if (dto.getSrchTraGbn() != null) 
	        	builder.queryParam("srchTraGbn", URLEncoder.encode(dto.getSrchTraGbn(), "UTF-8"));
	        if (dto.getSrchTraArea1() != null) 
	        	builder.queryParam("srchTraArea1", URLEncoder.encode(dto.getSrchTraArea1(), "UTF-8"));
						
			uri = builder.build(true).toUri();
			url = uri.toString();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		return url;
	}
	
	// XML 엘리먼트의 값을 가져오는 유틸리티 메소드
    private String getElementValue(Element element, String tagName) {
        NodeList nodeList = element.getElementsByTagName(tagName);
        if (nodeList.getLength() > 0) {
            Node node = nodeList.item(0);
            return node.getTextContent();
        } else {
            System.out.println("Element value for tag " + tagName + " not found.");
            return "";
        }
    }
}
