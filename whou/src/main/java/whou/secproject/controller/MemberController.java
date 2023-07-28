package whou.secproject.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.apis.NaverApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import whou.secproject.component.CertiDTO;
import whou.secproject.component.JobDicDetailResponseDTO;
import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecoResultDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.SelectDTO;
import whou.secproject.component.TestReinforcementDTO;
import whou.secproject.mapper.MemberMapper;
import whou.secproject.repository.JobDicApiDAO;
import whou.secproject.repository.RecommendDAO;
import whou.secproject.service.AptitudeService;
import whou.secproject.service.MemberService;
import whou.secproject.service.RecommendService;
import whou.secproject.service.WhouModelCustomService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private AptitudeService serviceAt;
	
	@Autowired
	private RecommendDAO redao;

	@Autowired
	private RecommendService serviceRe;
	
	@Autowired
	private WhouModelCustomService serviceMo;
	
	@Autowired
	private MemberMapper mapperMem;
	
	@Autowired
	private JobDicApiDAO dao;
	

	// 북마크
	   @RequestMapping("/bookmark")
	   public String bookmark(HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      String memId = (String)session.getAttribute("memId");
	      String job_cd = request.getParameter("job_cd");
	      int num = Integer.parseInt(request.getParameter("contain"));
	      boolean contain = false;
	      if(num == 1) {
	         contain = true;
	      }   
	      if(memId != null) {
	         service.updateBook(job_cd, memId, contain);
	      }
	        return "redirect:/job/info?job_cd=" + job_cd;
	   }
	
	 //마이페이지에서 북마크 직업 제거
     @RequestMapping("/deleteBook")
    public String deleteBook(HttpServletRequest request){
        HttpSession session = request.getSession();
      String memId = (String)session.getAttribute("memId");
      String job_cd = request.getParameter("job_cd");
      if(memId != null) {
         service.updateBook(job_cd, memId, true);
      }
      return "redirect:/member/mypage";
   }
	     
	//회원가입 폼
	@RequestMapping("/joinForm")
	public String  joinForm() {
		
		return "/user/joinForm";
	}
	
	//로그인 폼
	@RequestMapping("/login")
	public String  login() {
		
		return "/user/login";
	}
	
	//로그인
	@RequestMapping("/loginPro")
	public @ResponseBody String  loginPro(String email, String pw, HttpServletRequest request) {
		String dpw = service.login(email);
		System.out.println(dpw);
		HttpSession session = request.getSession();
		if(pw.equals(dpw)) {
			session.setAttribute("memId", email);
			System.out.println("비번 일치");
		}
		return dpw;
	}
	
	//메인페이지(세션확인)
	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		System.out.println(memId);
		model.addAttribute("memId", memId);
		return "/main";
	}
	
	
	//로그아웃
  	@RequestMapping("/logout")
  	public String logout(HttpSession session, HttpServletRequest request, Model model ) {
  	    session.removeAttribute("access_Token");
  	    session.removeAttribute("memId");
  		return "/main";
  	}
  	
  	//이메일 찾기 폼
  	@RequestMapping("/findEmail")
  	public String findEmail(HttpSession session, HttpServletRequest request, Model model ) {
  		return "/user/findEmail";
  	}
  	
  	//이메일 찾기
  	@RequestMapping("/findEmailPro")
  	public @ResponseBody String findEmailPro(String name, String tel) {
  		System.out.println(name+" ////// "+tel);
  		String email = service.getEmail(name, tel);
  		String type = null;
  		if(email != null) {
  	  		type = service.join_type(email);
  		}
  		if(email == null) { //가입한적 없음
  	  		return "0";
  		}else if(email != null && !type.equals("whoU")) { //소셜가입
  			return "1";
  		}else{ //자체가입함
  	  		return email;
  		}
  	}
  	//이메일 찾기 결과
  	@RequestMapping("/findEmailPro2")
  	public String findEmailPro2(Model model,@RequestParam("result") String result) {
  		model.addAttribute("email", result);
  		return "/user/findEmailPro";
  	}
  	
  	//비밀번호 찾기 폼
  	@RequestMapping("/findPw")
  	public String findPw(HttpSession session, HttpServletRequest request, Model model ) {
  		return "/user/findPw";
  	}
  	
  	//비밀번호 찾기
  	@RequestMapping("/findPwPro")
  	public @ResponseBody String findPwPro(String email) {
  		String dpw = service.login(email);
  		String type = service.join_type(email);
  		if(dpw == null && type == null) { //가입한적 없음
  	  		return "0";
  		}else if(dpw == null && type != null) { //소셜가입
  			return "1";
  		}else { //자체가입함
  	  		return dpw;
  		}
  	}
  	
  	//비밀번호 찾기 결과
  	@RequestMapping("/findPwPro2")
  	public String findPwPro2(Model model,@RequestParam("result") String result) {
  		model.addAttribute("pw", result);
  		return "/user/findPwPro2";
  	}
	
	//네이버 로그인
	@RequestMapping("/naver")
    public String naverLogin(HttpServletRequest request) {
        OAuth20Service service = new ServiceBuilder("QWYmFRRrJidAIVICUYXk")
        		.apiSecret("SjbYDHwrH9")
                .callback("http://localhost:8080/whou/member/Ncallback")
                .build(NaverApi.instance());
        
        String authorizationUrl = service.getAuthorizationUrl();

        request.getSession().setAttribute("oauth2Service", service);

        
        return "redirect:" + authorizationUrl;
    }
    
	//네이버 콜백
    @RequestMapping("/Ncallback")
    public String naverCallback(@RequestParam("code") String code, HttpServletRequest request, Model model) throws IOException, InterruptedException, ExecutionException {
        OAuth20Service serv = (OAuth20Service) request.getSession().getAttribute("oauth2Service");
        
        OAuth2AccessToken accessToken = serv.getAccessToken(code);
        
        // HttpClient를 사용하여 요청을 보냅니다.
        HttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("https://openapi.naver.com/v1/nid/me");
        httpGet.addHeader("X-Naver-Client-Id", "QWYmFRRrJidAIVICUYXk");
        httpGet.addHeader("X-Naver-Client-Secret", "SjbYDHwrH9");
        httpGet.addHeader("Authorization", "Bearer " + accessToken.getAccessToken());

        HttpResponse httpResponse = httpClient.execute(httpGet);
        String responseBody = EntityUtils.toString(httpResponse.getEntity());
        
        // JSON 파싱을 위한 ObjectMapper 인스턴스 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // JSON 데이터 파싱
        JsonNode jsonNode = objectMapper.readTree(responseBody);

        // 사용자 정보 추출
        //String id = jsonNode.get("response").get("id").asText();
        String email = jsonNode.get("response").get("email").asText();
        
        System.out.println(jsonNode);
        
        //세션 생성
        HttpSession session = request.getSession();
		if (email != null) {
	        model.addAttribute("email", email);
	        int count = service.check(email);
	        if(count == 0) {
	        	model.addAttribute("join_type", "N");
	        	model.addAttribute("join", 1);
	        	return "/user/joinForm";
	        }else if(count == 1) {
	        	//가입타입을 검사해서 N이면 로그인 아니면 다른걸로 가입햇음
	        	String join = service.join_type(email);
	        	if(join.equals("N")) {
	        		session.setAttribute("memId", email);
			        session.setAttribute("access_Token", accessToken);
		        	return "/main";
	        	}else {
	        		model.addAttribute("warn", 1);
	        		return "/user/login";
	        	}
	        }
	    }else if(email == null){
	    	return "/user/joinForm";
	    }
        return "/main";
    }
    
    //카카오 로그인
  	@RequestMapping("/kakao")
  	public String login(@RequestParam("code") String code, Model model, HttpServletRequest request) {
  		String access_Token = service.getAccessToken(code);
  		System.out.println("/////토큰////"+access_Token);
  	    String email = service.getUserInfo(access_Token);
  		System.out.println("이메일------" + email);
  		HttpSession session = request.getSession();
  		if (email != null) {
  	        model.addAttribute("email", email);
  	        int count = service.check(email);
  	        System.out.println(count);
  	        if(count == 0) {
  	        	model.addAttribute("join_type", "K");
  	        	model.addAttribute("join", 1);
  	        	return "/user/joinForm";
  	        }else if(count == 1) {
  	        	//가입타입을 검사해서 N이면 로그인 아니면 다른걸로 가입햇음
  	        	String join = service.join_type(email);
  	        	System.out.println(join);
  	        	if(join.equals("K")) {
  	        		session.setAttribute("memId", email);
  			        session.setAttribute("access_Token", access_Token);
  		        	return "/main";
  	        	}else {
  	        		model.addAttribute("warn", 1);
  	        		return "/user/login";
  	        	}
  	        }
  	    }else if(email == null){
  	    	return "/user/joinForm";
  	    }
          return "/main";
    }
  		
	//구글 로그인
  	@RequestMapping("/google")
  	public String google(Model model, HttpServletRequest request) throws IOException {
		String googleLoginUrl = "https://accounts.google.com/o/oauth2/auth" +
		          "?client_id=" + "694729335668-knpidd602057l2ovrvk6qpqhqeub7b6c.apps.googleusercontent.com" +
		          "&redirect_uri=" + "http://localhost:8080/whou/member/googleLog" +
		          "&response_type=code" +
		          "&scope=email profile";
		System.out.println("구글 거쳐감");
		return "redirect:" + googleLoginUrl;
	}
  	
  	//구글 로그인프로
  	@RequestMapping("/googleLog")
  	public String googleLog(@RequestParam("code") String authorizationCode, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
  		try {
              GoogleTokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(
                      new NetHttpTransport(),
                      JacksonFactory.getDefaultInstance(),
                      "https://oauth2.googleapis.com/token",
                      "694729335668-knpidd602057l2ovrvk6qpqhqeub7b6c.apps.googleusercontent.com",
                      "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",
                      authorizationCode,
                      "http://localhost:8080/whou/member/googleLog"
              ).execute();

              // 접근 토큰 가져오기
              String accessToken = tokenResponse.getAccessToken();
              System.out.println(accessToken);
              
              // 접근 토큰으로 정보 가져오기
              ResponseEntity<String> json = service.getInfo(accessToken);
              System.out.println(json);
              
              // 회원 정보 파싱
              JsonParser jsonParser = new JsonParser();
              JsonObject jsonObject = jsonParser.parse(json.getBody()).getAsJsonObject();

              String email = jsonObject.get("email").getAsString();
              
              //세션 생성
              HttpSession session = request.getSession();
	      	  if (email != null) {
	      	      model.addAttribute("email", email);
	      	      int count = service.check(email);
	      	      System.out.println(count);
	      	      if(count == 0) {
	      	      		model.addAttribute("join_type", "G");
	      	        	model.addAttribute("join", 1);
	      	        	return "/user/joinForm";
	      	      }else if(count == 1) {
	      	        	//가입타입을 검사해서 N이면 로그인 아니면 다른걸로 가입햇음
	      	        	String join = service.join_type(email);
	      	        	if(join.equals("G")) {
	      	        		session.setAttribute("memId", email);
	      			        session.setAttribute("access_Token", accessToken);
	      		        	return "/main";
	      	        	}else {
	      	        		model.addAttribute("warn", 1);
	      	        		return "/user/login";
	      	        	}
	      	      }
	      	  }else if(email == null){
	      	    	return "/user/joinForm";
	      	  }
	              return "/main"; // 인증이 성공한 경우 리디렉션할 페이지
	       } catch (IOException e) {
	              // 예외 처리
	              return "redirect:/error"; // 인증이 실패한 경우 리디렉션할 페이지
	       }
  	}
  	//중복확인 & 추가정보
  	@PostMapping("/check")
  	public @ResponseBody int check(MemberDTO dto, HttpSession session) {
		
		
  	    System.out.println(dto);
  	    int count = service.count(dto.getTel());
  	    int check = service.check(dto.getEmail());
  	    System.out.println(count);
  	    int result = 0;

  	    if (count == 1 || check == 1) {
  	        result = 1;
  	        session.invalidate();
  	        
  	    }else if(count == 0 && check == 0){
  	    	result = 0;
  	    	service.insertPro(dto);
  		  	service.insert2(dto.getEmail());
  	        session.setAttribute("memId", dto.getEmail());
	  	    String memId = (String)session.getAttribute("memId");
	  		int userNum = 0;
	  		userNum=serviceAt.userNumSelect(memId);
  	        serviceAt.createTableSet(userNum);
  	    }
  	    System.out.println(result);
  	    return result;
  	}
  	
  	@RequestMapping("/telChk")
  	public @ResponseBody String telChk(String tel) {
        Random rand  = new Random(); //랜덤숫자 생성하기 !!
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        service.telChk(tel, numStr);
        System.out.println(numStr);
        return numStr;
    }	
  	
  	@RequestMapping("/emailChk")
  	public @ResponseBody int emailChk(String email) {
  		int result = service.check(email);
        return result;
    }
  	
  	//마이페이지
  	@RequestMapping("/mypage")
    public String mypage(Model model, HttpServletRequest request, String load){
  		model.addAttribute("load", load);
  		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		model.addAttribute("memId", memId);
		// user_info 테이블에서 세션에 해당하는 num 추출
		System.out.println("세션있냐?"+memId);
		int userNum = 0;
		if(memId != null) {
			userNum=serviceAt.userNumSelect(memId);
		}
			
		// ai model 가져오기
		if(memId != null) {
			model.addAttribute("model", serviceMo.customModel(memId));
		}
		System.out.println("userNum왜안댐? "+userNum);
		// 적성 차트 점수
	      String scoreA = serviceAt.getAptitudeScore(userNum);
	      Boolean scoreTrue = false;
	      if(scoreA != null) {         
	         String [] scoreArr= scoreA.split("\\+");
	         ObjectMapper objectMapper = new ObjectMapper();
	         String scoresA = null;
	         try {
	            scoresA = objectMapper.writeValueAsString(scoreArr);
	         } catch (JsonProcessingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         model.addAttribute("aptitudeScoreArr", scoresA);
	         scoreTrue = true;
	      }else {
	         model.addAttribute("aptitudeScoreArr", 0);
	      }
	      
	      // 적성 차트 이름
	      String scoreName = serviceAt.getAptitudeScoreName(userNum);
	      if(scoreName != null) {
	         String [] scoreNameArr= scoreName.split("\\+");
	         ObjectMapper objectMapperName = new ObjectMapper();
	         String scoresName = null;
	         try {
	            scoresName = objectMapperName.writeValueAsString(scoreNameArr);
	         } catch (JsonProcessingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         model.addAttribute("aptitudeNameArr", scoresName);
	         scoreTrue = true;

	      }else {
	         model.addAttribute("aptitudeNameArr", "[]");
	      }
	      
	      // 흥미 차트 점수
	      String scoreI = serviceAt.getInterestScore(userNum);
	      if(scoreI != null) {
	         String [] scoreArrI= scoreI.split("\\+");
	         ObjectMapper objectMapperI = new ObjectMapper();
	         String scoresI = null;
	         try {
	            scoresI = objectMapperI.writeValueAsString(scoreArrI);
	         } catch (JsonProcessingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         model.addAttribute("interestScoreArr", scoresI);
	         scoreTrue = true;

	      }else {
	         model.addAttribute("interestScoreArr", 0);
	      }
	      
	      // 가치관 차트 점수
	      String scoreV = serviceAt.getValuesScore(userNum);
	      if(scoreV != null) {
	         String [] scoreArrV= scoreV.split("\\,");
	         ObjectMapper objectMapperV = new ObjectMapper();
	         String scoresV = null;
	         try {
	            scoresV = objectMapperV.writeValueAsString(scoreArrV);
	         } catch (JsonProcessingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         model.addAttribute("valuesScoreArr", scoresV);
	         scoreTrue = true;
	      }else {
	         model.addAttribute("valuesScoreArr", 0);
	      }
	      String scoreAb = serviceAt.getAbilityScore(userNum);
	      if(scoreAb != null) {         
	         // 쉼표(,)를 기준으로 문자열을 분리하여 배열로 얻기
	         String[] elements = scoreAb.split(",", 10); // 최대 10개로 제한
	         
	         // 앞 3개와 뒤 6개를 String으로 합치기
	         String firstThree = String.join(",", Arrays.copyOfRange(elements, 0, 4));
	         String lastSix = String.join(",", Arrays.copyOfRange(elements, 4, elements.length));
	          model.addAttribute("firstThree", firstThree);
	          model.addAttribute("lastSix", lastSix);
	      }else {
	         model.addAttribute("firstThree", 0);
	          model.addAttribute("lastSix", 0);
	      }

	        // 마이페이지 top 검색
	        RecommandInfoDTO aptitudeRank = service.getAptitudeRank(userNum);
	        model.addAttribute("aptitudeRank", aptitudeRank);
	      model.addAttribute("scoreTrue", scoreTrue);
        
        
	    //북마크 가져오기
	         String temp = mapperMem.getBook(memId);
	         String [] books = null;
	         List<String> jobList = new ArrayList();
	         List<Job_infoDTO> job = new ArrayList();
	          if(temp!=null) {
	             books = temp.split(",");
	             for(String book : books) {
	                int job_cd = Integer.parseInt(book);
	                System.out.println("직업 번호ㅗㅗㅗㅗㅗㅗ"+job_cd);
	                //북마크 직업 정보 가져오기
	                job.add(service.getJob(job_cd));
	                model.addAttribute("books", books);
	                model.addAttribute("jobs", job);
	             }
	          }
        
        
        // user_info의 num을 이용하여 cunsulting_num(직업백과 job_cd) 컬럼 값 get
        Integer cunsultingNum = 0;
        if(memId != null) {
        	cunsultingNum = service.getCunsultingNum(userNum);
        	if(cunsultingNum==null)cunsultingNum = 0;
        }
        
    	List<String> needAvil = new ArrayList<>();//직업의 능력
    	if(cunsultingNum>0) {
    		// 직업 백과에서 정보 뜯어오기
    		JobDicDetailResponseDTO jobDetailCunsuling = dao.getJobDicDetail(cunsultingNum);
    		String [] majorChartMajor = jobDetailCunsuling.getMajorChart().get(0).getMajor().split(","); // 종사자 전공 비율 항목
    		String [] majorChartMajorData = jobDetailCunsuling.getMajorChart().get(0).getMajor_data().split(","); //종사전 전공 비율 값
    		model.addAttribute("majorChartMajor", majorChartMajor);
    		model.addAttribute("majorChartMajorData", majorChartMajorData);
    		model.addAttribute("jobDetailCunsuling", jobDetailCunsuling);
    		
    		for(int i=0; i<jobDetailCunsuling.getAbilityList().size();i++) {
    			needAvil.add(jobDetailCunsuling.getAbilityList().get(i).getAbility_name());
    		}
    	}
    	model.addAttribute("cunsultingNum", cunsultingNum);
    	model.addAttribute("needAvil", needAvil);
    	
    	
    	
    	//역량 보완법을 위해 크롤링한 결과에서 21번 테스트의 역량별 수치 가져옴
    	if(memId != null && userNum >0) {
    		System.out.println("++service.getRecentTest21(userNum)+++ "+service.getRecentTest21(userNum));
    		String avilReinforce="";
    		avilReinforce=service.getRecentTest21(userNum);
    		
    		if(avilReinforce!=null) {
	    		double [] avilArrDouble = new double [11];
	    		if(avilReinforce.length()>10) {
	    			String [] avilArrString = avilReinforce.split("\\+");
	    			for(int i=0; i<11; i++) {
	    				avilArrDouble[i]=Double.parseDouble(avilArrString[i]);
	    				//0음악능력  1예술시각능력  2언어능력  3수리·논리력  4공간지각력
	    				//5자기성찰능력  6창의력  7대인관계능력  8신체·운동능력  9자연친화력  10손재능
	    			}
	    			
	    			// 해당 직업에서 요구하는 능력치의 value
	    			double [] avilArrValue = new double [needAvil.size()];
	    			int avilNum = -1;
	    			List<TestReinforcementDTO> reinDTO=new ArrayList<>();
	    			for(int i=0; i<needAvil.size(); i++) {
	    				switch(needAvil.get(i)) {
	    				case "음악능력": avilArrValue[i]=avilArrDouble[0]; avilNum=0; break;
	//	        		case "예술시각능력": avilArrValue[i]=avilArrDouble[1]; avilNum=1; break;
	    				case "예술시각능력": avilArrValue[i]=1000; avilNum=1; break;
	//	        		case "언어능력": avilArrValue[i]=avilArrDouble[2]; avilNum=2; break;
	    				case "언어능력": avilArrValue[i]=1000; avilNum=2; break;
	    				case "수리·논리력": avilArrValue[i]=avilArrDouble[3]; avilNum=3; break;
	    				case "공간지각력": avilArrValue[i]=avilArrDouble[4]; avilNum=4; break;
	//	        		case "자기성찰능력": avilArrValue[i]=avilArrDouble[5]; avilNum=5; break;
	    				case "자기성찰능력": avilArrValue[i]=1000; avilNum=5; break;
	    				case "창의력": avilArrValue[i]=avilArrDouble[6]; avilNum=6; break;
	//	        		case "대인관계능력": avilArrValue[i]=avilArrDouble[7]; avilNum=7; break;
	    				case "대인관계능력": avilArrValue[i]=1000; avilNum=7; break;
	    				case "신체·운동능력": avilArrValue[i]=avilArrDouble[8]; avilNum=8; break;
	    				case "자연친화력": avilArrValue[i]=avilArrDouble[9]; avilNum=9; break;
	    				case "손재능": avilArrValue[i]=avilArrDouble[10]; avilNum=10; break;
	    				}
	    				reinDTO.add(service.getTestReinforcement(avilNum));
	    			}
	    			model.addAttribute("reinDTO",reinDTO);
	    			model.addAttribute("avilArrValue",avilArrValue);
	    		}
	    		model.addAttribute("avilReinforce",avilReinforce);
    		}
    	}
        
        
    	// 추천
        RecommandInfoDTO redto = serviceRe.getTestResult(userNum);
        CertiDTO certiDTO = new CertiDTO();
        certiDTO.setNum(userNum);
        certiDTO.setCol("SCHOOL_MAJOR");
        ArrayList<String> majors = serviceRe.majorInfo(certiDTO);
        certiDTO.setCol("CERTIFICATE");
        ArrayList<String> certis= serviceRe.majorInfo(certiDTO);
        System.out.println(majors);
        System.out.println(certis);
        
//        int majorC = 0 , certiC = 0;
//        boolean none = false; 
//        if(majors!=null) majorC = majors.size();
//        if(certis!=null) certiC = certis.size();
//        if(redto.getAptitude_score()==null&&
//        		redto.getInterest_score()==null&&
//        		redto.getValues_score()==null&&
//        		majorC==0 && certiC==0) 
//        	none=true;
        
        int majorC = 0 , certiC = 0;
        if(majors!=null) majorC = majors.size();
        if(certis!=null) certiC = certis.size();
        boolean none = false; 
        if(redto != null) {
	        if(redto.getAptitude_score()==null&&
	           redto.getInterest_score()==null&&
	           redto.getValues_score()==null&&
	           majorC==0 && certiC==0) 
	           none=true;
        }else if(redto == null && majorC==0 && certiC==0) none=true;
        System.out.println(none);
        
//        String aptitude_score = redto.getAptitude_score()!=null ? redto.getAptitude_score():null;
//        String interest_score = redto.getInterest_score()!=null ? redto.getInterest_score():null;
//        String values_score = redto.getValues_score()!=null ? redto.getValues_score():null;
        
//        if(aptitude_score==null && interest_score==null && values_score==null
//        		&& majorC==0 && certiC==0) 
//        	none=true;
        
        if(!none) {
        	if(serviceRe.updateTrue(userNum)==1) {
        		List<String> valueCd = serviceRe.getValueCd("values_common"); // 가치 평균
        		List<Integer> jList = serviceRe.allJobCd("job_info"); // 직업 일련번호
        		int jC = jList.size(); // 직업 수
        		
        		List<String> scoreStrs = Arrays.asList( // 점수 리스트
        				redto.getAptitude_score(),redto.getInterest_score()); 
        		
        		List<ArrayList<String>> jobNumList = Arrays.asList( // 해당 직업 리스트
        				redto.getAptitude_jobs(),redto.getInterest_jobs());
        		
        		List<String> limitStrs = Arrays.asList("\\+","\\+"); // 구분자
        		List<Integer> importances = serviceRe.getImportances(userNum); // 중요도
        		boolean importanceTrue = importances!=null; // 중요도
        		System.out.println(importanceTrue);
        		if(!importanceTrue) importances = new ArrayList<Integer>(Arrays.asList(1,1,1));
        		LinkedHashMap<ArrayList<Double>,Double> scores = redao.DoubleTokener(scoreStrs, limitStrs);
        		System.out.println("scores"+scores);
        		List<Double> jobScore = new ArrayList<>(Collections.nCopies(jC, 1.0)); // 직업당 점수
        		System.out.println(10+majorC+certiC);
        		double [][] jobScorePoint = new double [jC][10+majorC+certiC];
        		if(serviceRe.tbTrue(userNum)==1) serviceRe.dropTable(userNum);
        		serviceRe.createJobPoint(userNum, majorC, certiC);
        		
        		int i = 0;
        		for (Map.Entry<ArrayList<Double>, Double> entry : scores.entrySet()) {
        			List<String> jobNum = jobNumList.get(i); // 해당하는 직업의 jcd
        			List<Double> normalize= redao.normalizePer(entry.getKey(), entry.getValue(), importances.get(i++)).subList(0, 3); // 3개만 적용
        			if(jobNum.size()!=0) {
        				for(int j = 0 ; j < normalize.size(); j++) {
        					double d = normalize.get(j); // 1.38~~
        					StringTokenizer st = new StringTokenizer(jobNum.get(j),",");
        					while(st.hasMoreTokens( )) {
        						int f = jList.indexOf(Integer.parseInt(st.nextToken()));
        						jobScore.set(f, jobScore.get(f)*d);
        						jobScorePoint[f][3*(i-1)+j] = normalize.get(j);
        					}
        				}
        			}
        		}
        		
        		List<Integer> valueList = null;
        		if(redto.getValues_score()!=null) {
        			valueList = redao.valueTokenizer(redto.getValues_score(), ",");
        			List<Double> defaultValue = Arrays.asList(50.82,52.89,45.83,48.52);
        			List<Double> valueScore = redao.valueScore(defaultValue, valueList, importances.get(2));
        			for(int k = 0 ; k < valueScore.size(); k++) {
        				String str = valueCd.get(k);
        				StringTokenizer st = new StringTokenizer(str,",");
        				while(st.hasMoreTokens()) {
        					int f = jList.indexOf(Integer.parseInt(st.nextToken()));
        					jobScore.set(f, jobScore.get(f)*valueScore.get(k));
        					jobScorePoint[f][6+k] = valueScore.get(k);
        				}
        			}
        		}
        		
        		if(majors!=null) {
        			SelectDTO selDTO = new SelectDTO();
        			int h = 10;
        			for(String major: majors) {
        				List<Integer> li = serviceRe.majorToCD(selDTO, major);
        				for(Integer l : li) {
        					l = jList.indexOf(l);
        					jobScore.set(l, jobScore.get(l)*1.1);
        					jobScorePoint[l][h] = 1.1;
        				}
        				h++;
        			}
        		}
        		if(certis!=null) {
        			SelectDTO selDTO = new SelectDTO();
        			int m = 10+majorC;
        			for(String certi: certis) {
        				List<Integer> li = serviceRe.majorToCD(selDTO, certi);
        				for(Integer l : li) {
        					l = jList.indexOf(l);
        					jobScore.set(l, jobScore.get(l)*1.1);
        					jobScorePoint[l][m] = 1.1;
        					System.out.println("certitreu"+jobScorePoint[l][m]+" "+l+" "+m);
        				}
        				m++;
        			}
        		}
        		
        		Map<Integer, Double> jcdToScore = new HashMap<>();
        		for (int idx = 0; idx < jList.size(); idx++) {
        			jcdToScore.put(jList.get(idx), jobScore.get(idx));
//           System.out.print(jList.get(idx)+": "+jobScore.get(idx)+" ");
//           for(int m = 0; m < 10+majorC+certiC; m++)
//                 System.out.print(jobScorePoint[idx][m]+" ");
        			serviceRe.insertJobPoint(userNum,jList.get(idx),jobScore.get(idx), jobScorePoint[idx], majorC, certiC);
//              System.out.println();
        		}
        	}
        	
        	
//        List<Map.Entry<Integer, Double>> list = new ArrayList<>(jcdToScore.entrySet());
//          Collections.sort(list, new Comparator<Map.Entry<Integer, Double>>() {
//              public int compare(Map.Entry<Integer, Double> o1, Map.Entry<Integer, Double> o2) {
//                  return o2.getValue().compareTo(o1.getValue());
//              }
//          });
        	
        	// 결과 출력
//          for (Map.Entry<Integer, Double> entry : list) {
//              System.out.println(entry.getKey() + ": " + entry.getValue()+" ");
//          }
        	SelectDTO selDTO = new SelectDTO();
        	List<HashMap<String, BigDecimal>> recoLi= serviceRe.getJobPoint(selDTO, userNum, 1, 5);
        	SelectDTO selDTO2 = new SelectDTO();
        	HashMap<String,String> top3NM = serviceRe.getRecoList(selDTO2, userNum);
        	ArrayList <String> colNM = new ArrayList<String>(
        			Arrays.asList("APTITUDE_NAME1","APTITUDE_NAME2",
        					"APTITUDE_NAME3","INTEREST_NAME1",
        					"INTEREST_NAME2","INTEREST_NAME3"));
        	ArrayList <String> colNM2 = new ArrayList<String>(
        			Arrays.asList("JOB_CD","TOTAL","APTITUDE1",
        					"APTITUDE2","APTITUDE3","INTEREST1",
        					"INTEREST2","INTEREST3","VALUE1","VALUE2",
        					"VALUE3","VALUE4"));
        	for(int c = 0 ; c < majorC; c++) colNM2.add("MAJOR"+(c+1));
        	for(int c = 0 ; c < certiC; c++) colNM2.add("CERTI"+(c+1));
        	System.out.println(colNM2);
        	SelectDTO selDTOJ = new SelectDTO();
        	ArrayList<RecoResultDTO> reres = new ArrayList<RecoResultDTO>();
        	for(int h = 0 ;  h < recoLi.size(); h++) {
        		RecoResultDTO reredto = new RecoResultDTO();
        		int job_cd = recoLi.get(h).get(colNM2.get(0)).intValue();
        		reredto.setJob_cd(job_cd);
        		reredto.setJob_nm(serviceRe.getJname(selDTOJ, job_cd));
        		for(int c = 0; c < 11+majorC+certiC; c++) {
        			String factor = null, detail = null;
        			if(c == 0) factor = "직업 일련번호";
        			else if(c == 1) factor = "총점";
        			else if(c < 8) {
        				factor = top3NM.get(colNM.get(c-2));
        				if(factor==null) factor=(c-1)+"?";
        				if(1<c&& c<5) detail ="적성";
        				else detail ="흥미";
        				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
        					reredto.setDescription(
        							"당신의 "+detail+" 중 " +factor+"은 당신의 직업 적합도 종합 점수에 약 "+
        									Math.round(recoLi.get(h).get(colNM2.get(c)).doubleValue()*100-100)+"% 기");
        				}
        			}
        			else if(7<c&&c<12) {
        				if(c==8) factor = "안전지향";
            			else if(c==9) factor = "의미지향";
            			else if(c==10) factor = "변화지향";
            			else if(c==11) factor = "성취지향";
        				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
        					reredto.setDescription(
        							" 표준 "+factor+" 부분에서 당신의 직업 적합도 종합 점수에 약 "+
        									Math.round(recoLi.get(h).get(colNM2.get(c)).doubleValue()*100-100)+"% 기");
        				}
        			}
        			else if(c<11+majorC) {
        				factor = majors.get(c-11);
        				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
        					reredto.setDescription(
        						" 학위 "+factor+" 는 이 직업에서 도움이 되기에 10%");
        				}
        			}
        			else if(c<11+majorC+certiC) { 
        				factor = certis.get(c-11-majorC);
        				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
        					reredto.setDescription(
        						" 자격증 "+factor+" 는 이 직업에서 도움이 되기에 10%");
        				}
        			}
        			
        		}
        		reres.add(reredto);
        	}
        	model.addAttribute("reres", reres);
        }
        model.addAttribute("none", none);
		return "/user/mypage";
	}
  	
  	//자격증 리스트 가져오기
	@RequestMapping("/getCerti")
    public @ResponseBody List<String> getCerti(String certi){
		List<String> certiList = service.getCerti(certi); 
		System.out.println(certiList);
		return certiList;
	}
	
	//학과 리스트 가져오기
	@RequestMapping("/getMajor")
    public @ResponseBody List<String> getMajor(@RequestParam("major") String major,
            									@RequestParam("univSe") String univSe){
		List<String> majorList = service.getMajor(major, univSe); 
		System.out.println(majorList);
		return majorList;
	}
	
	//회원 추가 정보 수정(자격증, 학과)
	@RequestMapping("/updateInfo")
	public String updateInfo(@RequestParam(value = "certi", required = false) List<String> certiList,
	                         @RequestParam(value = "major", required = false) List<String> majorList, HttpServletRequest request, Model model){
		
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		String combinedCerti = null;
		String combinedMajor = null;
		System.out.println("Certi "+certiList);
		System.out.println("Major "+majorList);
		
		if (certiList != null && majorList != null) {
			combinedCerti = String.join(",", certiList);
	        System.out.println("Certi2 "+combinedCerti);
	        combinedMajor = String.join(",", majorList);
	        System.out.println("Major2 "+combinedMajor);
	        service.updateInfo(combinedCerti, combinedMajor, memId);
	        serviceAt.commendNumUpdate(memId);
	        
	        model.addAttribute("load", "2");
	    }
	    return "redirect:/member/mypage";
	}
	
	// 추천 리스트 가져오기
	@RequestMapping("/getRecoLi")
    public @ResponseBody ArrayList<RecoResultDTO> getRecoLi(@RequestParam("page") int page,
            									@RequestParam("size") int size,
            									HttpSession session){
		String memId = (String)session.getAttribute("memId");
		// user_info 테이블에서 세션에 해당하는 num 추출
		int userNum = 0;
		if(memId != null) userNum=serviceAt.userNumSelect(memId);
		
        CertiDTO certiDTO = new CertiDTO();
        certiDTO.setNum(userNum);
        certiDTO.setCol("SCHOOL_MAJOR");
        ArrayList<String> majors = serviceRe.majorInfo(certiDTO);
        certiDTO.setCol("CERTIFICATE");
        ArrayList<String> certis= serviceRe.majorInfo(certiDTO);
        int majorC = 0 , certiC = 0;
        if(majors!=null) majorC = majors.size();
        if(certis!=null) certiC = certis.size();
        
        SelectDTO selDTO = new SelectDTO();
    	List<HashMap<String, BigDecimal>> recoLi= serviceRe.getJobPoint(selDTO, userNum, page, size);
    	SelectDTO selDTO2 = new SelectDTO();
    	HashMap<String,String> top3NM = serviceRe.getRecoList(selDTO2, userNum);
    	ArrayList <String> colNM = new ArrayList<String>(
    			Arrays.asList("APTITUDE_NAME1","APTITUDE_NAME2",
    					"APTITUDE_NAME3","INTEREST_NAME1",
    					"INTEREST_NAME2","INTEREST_NAME3"));
    	ArrayList <String> colNM2 = new ArrayList<String>(
    			Arrays.asList("JOB_CD","TOTAL","APTITUDE1",
    					"APTITUDE2","APTITUDE3","INTEREST1",
    					"INTEREST2","INTEREST3","VALUE1","VALUE2",
    					"VALUE3","VALUE4"));
    	for(int c = 0 ; c < majorC; c++) colNM2.add("MAJOR"+(c+1));
    	for(int c = 0 ; c < certiC; c++) colNM2.add("CERTI"+(c+1));
    	SelectDTO selDTOJ = new SelectDTO();
    	ArrayList<RecoResultDTO> reres = new ArrayList<RecoResultDTO>();
    	for(int h = 0 ;  h < recoLi.size(); h++) {
    		RecoResultDTO reredto = new RecoResultDTO();
    		int job_cd = recoLi.get(h).get(colNM2.get(0)).intValue();
    		reredto.setJob_cd(job_cd);
    		reredto.setJob_nm(serviceRe.getJname(selDTOJ, job_cd));
    		for(int c = 0; c < 11+majorC+certiC; c++) {
    			String factor = null, detail = null;
    			if(c == 0) factor = "직업 일련번호";
    			else if(c == 1) factor = "총점";
    			else if(c < 8) {
    				factor = top3NM.get(colNM.get(c-2));
    				if(factor==null) factor=(c-1)+"?";
    				if(1<c&& c<5) detail ="적성";
    				else detail ="흥미";
    				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
    					reredto.setDescription(
    							"당신의 "+detail+" 중 " +factor+"은 당신의 표준 "+detail+" 점수 기여도에 비해 약 "+
    									Math.round(recoLi.get(h).get(colNM2.get(c)).doubleValue()*100-100)+"% 높");
    				}
    			}
    			else if(7<c&&c<12) {
    				if(c==8) factor = "안전지향";
        			else if(c==9) factor = "의미지향";
        			else if(c==10) factor = "변화지향";
        			else if(c==11) factor = "성취지향";
    				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
    					reredto.setDescription(
    							" 표준 "+factor+" 점수 기여도에 비해 약 "+
    									Math.round(recoLi.get(h).get(colNM2.get(c)).doubleValue()*100-100)+"% 높");
    				}
    			}
    			else if(c<11+majorC) {
    				factor = majors.get(c-11);
    				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
    					reredto.setDescription(
    						" 학위 "+factor+" 는 이 직업에서 도움이 되");
    				}
    			}
    			else if(c<11+majorC+certiC) { 
    				factor = certis.get(c-11-majorC);
    				if(recoLi.get(h).get(colNM2.get(c)).doubleValue()!=0.0) {
    					reredto.setDescription(
    						" 자격증 "+factor+" 는 이 직업에서 도움이 되");
    				}
    			}
    		}
    		reres.add(reredto);
    	}
    	return reres;
	}
	//회원 추가 정보 수정(자격증, 학과)
		@RequestMapping("/insertConsult")
		public String updateInfo(HttpServletRequest request){
			
			HttpSession session = request.getSession();
			String memId = (String)session.getAttribute("memId");
			int userNum = 0;
			if(memId != null) userNum=serviceAt.userNumSelect(memId);
			String job_cdStr = request.getParameter("job_cd");
			System.out.println(job_cdStr);
			int job_cd = 0;
			if(job_cdStr != null) job_cd= Integer.parseInt(job_cdStr);
			serviceRe.insertConsult(userNum, job_cd);
			
		    return "redirect:/member/mypage";
		}
}
