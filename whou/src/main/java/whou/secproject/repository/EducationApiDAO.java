package whou.secproject.repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
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
import org.xml.sax.InputSource;

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
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	    
	    // 객체 byte 배열로 받은 후 utf처리
	    RestTemplate restTemplate = new RestTemplate();
	    ResponseEntity<byte[]> response = restTemplate.getForEntity(uri, byte[].class);
	    byte[] responseBodyBytes = response.getBody();
	    String responseBody = new String(responseBodyBytes, StandardCharsets.UTF_8);

	    EducationMajorResponseDTO educationMajorResponseDTO = null;
	    try {
	        ObjectMapper objectMapper = new ObjectMapper();
	        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	        educationMajorResponseDTO = objectMapper.readValue(responseBody, EducationMajorResponseDTO.class);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
			e.printStackTrace();
		}
	    return educationMajorResponseDTO;
	}
		
	
		
	
	//hrdnet 교육 정보 리스트 API
	public List<EducationHrdResponseDTO> getHrdApi(String param, EducationHrdParamDTO hrdParam) {
		String url = null;
		if(param != null) {
			url = getHrdURL(param, hrdParam);
		}
		
		List<EducationHrdResponseDTO> educationHrdResponseList = new ArrayList<>();
		try {
			// HTTP 요청 보내기
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			conn.setRequestMethod("GET");
			
			// 응답 코드 확인
			int responseCode = conn.getResponseCode();
			
			if (responseCode == HttpURLConnection.HTTP_OK) {
				// 응답 데이터 읽기
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(conn.getInputStream(), "EUC-KR"));
				StringBuilder response = new StringBuilder();
				String line;
				while ((line = reader.readLine()) != null) {
					response.append(line);
				}
				
				// 응답 데이터를 XML로 파싱
				String xmlData = response.toString();
				
				// XML 파서 설정
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document document = builder.parse(new InputSource(new StringReader(xmlData)));
				
				// "HRDNet" 엘리먼트를 찾습니다.
				Element hrdnetElement = document.getDocumentElement();
				
				// "srchList" 엘리먼트를 찾습니다.
				Element srchListElement = (Element) hrdnetElement.getElementsByTagName("srchList").item(0);
				
				// "scn_list" 엘리먼트들을 찾습니다.
				NodeList scnListNodes = srchListElement.getElementsByTagName("scn_list");
				
				for (int i = 0; i < scnListNodes.getLength(); i++) {
					Node itemNode = scnListNodes.item(i);
					if (itemNode.getNodeType() == Node.ELEMENT_NODE) {
						Element itemElement = (Element) itemNode;
						
						String address = getElementValue(itemElement, "address");
						String subTitle = getElementValue(itemElement, "subTitle");
						String title = getElementValue(itemElement, "title");
						String titleLink = getElementValue(itemElement, "titleLink");
						String traStartDate = getElementValue(itemElement, "traStartDate");
						String traEndDate = getElementValue(itemElement, "traEndDate");
						
						EducationHrdResponseDTO educationHrdResponseDTO = new EducationHrdResponseDTO();
						educationHrdResponseDTO.setAddress(address);
						educationHrdResponseDTO.setSubTitle(subTitle);
						educationHrdResponseDTO.setTitle(title);
						educationHrdResponseDTO.setTitleLink(titleLink);
						educationHrdResponseDTO.setTraStartDate(traStartDate);
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
		
		StringBuilder url = new StringBuilder();
		url.append("https://www.hrd.go.kr/jsp/HRDP/HRDPO00/").append(param)
		.append("?authKey=").append(authKey)
		.append("&returnType=XML").append("&sortCol=TRNG_BGDE").append("&outType=1");
		
		
		if (dto.getSrchNcs1() != null && !(dto.getSrchNcs1().equals("")) ) {
			url.append("&srchNcs1=").append(dto.getSrchNcs1());
		}
		if (dto.getSrchKeco1() != null && !(dto.getSrchKeco1().equals("")) ) { 
			url.append("&srchKeco1=").append(dto.getSrchKeco1());
		}
		if (dto.getSrchTraOrganNm() != null && !(dto.getSrchTraOrganNm().equals("")) ) { 
			url.append("&srchTraOrganNm=").append(dto.getSrchTraOrganNm());
		}
		if (dto.getSrchTraProcessNm() != null && !(dto.getSrchTraProcessNm().equals("")) ) { 
			url.append("&srchTraProcessNm=").append(dto.getSrchTraProcessNm());
		}
		if (dto.getSrchTraStDt() != null && !(dto.getSrchTraStDt().equals("")) ) { 
			url.append("&srchTraStDt=").append(dto.getSrchTraStDt());
		}
		if (dto.getSrchTraEndDt() != null && !(dto.getSrchTraEndDt().equals("")) ) { 
			url.append("&srchTraEndDt=").append(dto.getSrchTraEndDt());
		}
		if (dto.getSort() != null && !(dto.getSort().equals("")) ) { 
			url.append("&sort=").append(dto.getSort());
		}
		if (dto.getSrchTraGbn() != null && !(dto.getSrchTraGbn().equals("")) ) { 
			url.append("&srchTraGbn=").append(dto.getSrchTraGbn());
		}
		if (dto.getSrchTraArea1() != null && !(dto.getSrchTraArea1().equals("")) ) {
			url.append("&srchTraArea1=").append(dto.getSrchTraArea1());
		}
		if (dto.getPageSize() != null && !(dto.getPageSize().equals("")) ) {
			url.append("&pageSize=").append(dto.getPageSize());
		}
		if (dto.getPageNum() != null && !(dto.getPageNum().equals("")) ) {
			url.append("&pageNum=").append(dto.getPageNum());
		}
		
		return url.toString();
	}
	
	
	
	
	
	// XML 엘리먼트의 값을 가져오는 유틸리티 메소드
	public String getElementValue(Element element, String tagName) {
	    NodeList nodeList = element.getElementsByTagName(tagName);
	    if (nodeList != null && nodeList.getLength() > 0) {
	        Node node = nodeList.item(0);
	        if (node.getNodeType() == Node.ELEMENT_NODE) {
	            Element childElement = (Element) node;
	            return childElement.getTextContent();
	        }
	    }
	    return null;
	}
}
