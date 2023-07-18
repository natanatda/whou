package whou.secproject.controller;

import java.io.IOException;
import java.util.Random;
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

import whou.secproject.component.MemberDTO;
import whou.secproject.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	//�쉶�썝媛��엯 �뤌
	@RequestMapping("/joinForm")
	public String  joinForm() {
		
		return "/user/joinForm";
	}
	
	//濡쒓렇�씤 �뤌
	@RequestMapping("/login")
	public String  login() {
		
		return "/user/login";
	}
	
	//濡쒓렇�씤
	@RequestMapping("/loginPro")
	public @ResponseBody String  loginPro(String email, String pw, HttpServletRequest request) {
		String dpw = service.login(email);
		System.out.println(dpw);
		HttpSession session = request.getSession();
		if(pw.equals(dpw)) {
			session.setAttribute("memId", email);
			System.out.println("鍮꾨쾲 �씪移�");
		}
		return dpw;
	}
	
	//硫붿씤�럹�씠吏�(�꽭�뀡�솗�씤)
	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		System.out.println(memId);
		model.addAttribute("memId", memId);
		return "/main";
	}
	
	//濡쒓렇�븘�썐
  	@RequestMapping("/logout")
  	public String logout(HttpSession session, HttpServletRequest request, Model model ) {
  	    session.removeAttribute("access_Token");
  	    session.removeAttribute("memId");
  		return "/main";
  	}
  	
  	//�씠硫붿씪 李얘린 �뤌
  	@RequestMapping("/findEmail")
  	public String findEmail(HttpSession session, HttpServletRequest request, Model model ) {
  		return "/user/findEmail";
  	}
  	
  	//�씠硫붿씪 李얘린
  	@RequestMapping("/findEmailPro")
  	public @ResponseBody String findEmailPro(String name, String tel) {
  		System.out.println(name+" ////// "+tel);
  		String email = service.getEmail(name, tel);
  		String type = null;
  		if(email != null) {
  	  		type = service.join_type(email);
  		}
  		if(email == null) { //媛��엯�븳�쟻 �뾾�쓬
  	  		return "0";
  		}else if(email != null && type != null) { //�냼�뀥媛��엯
  			return "1";
  		}else{ //�옄泥닿��엯�븿
  	  		return email;
  		}
  	}
  	//�씠硫붿씪 李얘린 寃곌낵
  	@RequestMapping("/findEmailPro2")
  	public String findEmailPro2(Model model,@RequestParam("result") String result) {
  		model.addAttribute("email", result);
  		return "/user/findEmailPro";
  	}
  	
  	//鍮꾨�踰덊샇 李얘린 �뤌
  	@RequestMapping("/findPw")
  	public String findPw(HttpSession session, HttpServletRequest request, Model model ) {
  		return "/user/findPw";
  	}
  	
  	//鍮꾨�踰덊샇 李얘린
  	@RequestMapping("/findPwPro")
  	public @ResponseBody String findPwPro(String email) {
  		String dpw = service.login(email);
  		String type = service.join_type(email);
  		if(dpw == null && type == null) { //媛��엯�븳�쟻 �뾾�쓬
  	  		return "0";
  		}else if(dpw == null && type != null) { //�냼�뀥媛��엯
  			return "1";
  		}else { //�옄泥닿��엯�븿
  	  		return dpw;
  		}
  	}
  	
  	//鍮꾨�踰덊샇 李얘린 寃곌낵
  	@RequestMapping("/findPwPro2")
  	public String findPwPro2(Model model,@RequestParam("result") String result) {
  		model.addAttribute("pw", result);
  		return "/user/findPwPro2";
  	}
	
	//�꽕�씠踰� 濡쒓렇�씤
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
    
	//�꽕�씠踰� 肄쒕갚
    @RequestMapping("/Ncallback")
    public String naverCallback(@RequestParam("code") String code, HttpServletRequest request, Model model) throws IOException, InterruptedException, ExecutionException {
        OAuth20Service serv = (OAuth20Service) request.getSession().getAttribute("oauth2Service");
        
        OAuth2AccessToken accessToken = serv.getAccessToken(code);
        
        // HttpClient瑜� �궗�슜�븯�뿬 �슂泥��쓣 蹂대깄�땲�떎.
        HttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("https://openapi.naver.com/v1/nid/me");
        httpGet.addHeader("X-Naver-Client-Id", "QWYmFRRrJidAIVICUYXk");
        httpGet.addHeader("X-Naver-Client-Secret", "SjbYDHwrH9");
        httpGet.addHeader("Authorization", "Bearer " + accessToken.getAccessToken());

        HttpResponse httpResponse = httpClient.execute(httpGet);
        String responseBody = EntityUtils.toString(httpResponse.getEntity());
        
        // JSON �뙆�떛�쓣 �쐞�븳 ObjectMapper �씤�뒪�꽩�뒪 �깮�꽦
        ObjectMapper objectMapper = new ObjectMapper();

        // JSON �뜲�씠�꽣 �뙆�떛
        JsonNode jsonNode = objectMapper.readTree(responseBody);

        // �궗�슜�옄 �젙蹂� 異붿텧
        //String id = jsonNode.get("response").get("id").asText();
        String email = jsonNode.get("response").get("email").asText();
        
        System.out.println(jsonNode);
        
        //�꽭�뀡 �깮�꽦
        HttpSession session = request.getSession();
		if (email != null) {
	        model.addAttribute("email", email);
	        int count = service.check(email);
	        if(count == 0) {
	        	model.addAttribute("join_type", "N");
	        	model.addAttribute("join", 1);
	        	return "/user/joinForm";
	        }else if(count == 1) {
	        	//媛��엯���엯�쓣 寃��궗�빐�꽌 N�씠硫� 濡쒓렇�씤 �븘�땲硫� �떎瑜멸구濡� 媛��엯�뻼�쓬
	        	String join = service.join_type(email);
	        	if(join.equals("N")) {
	        		session.setAttribute("memId", email);
			        session.setAttribute("access_Token", accessToken);
		        	return "/main";
	        	}else {
	        		model.addAttribute("warn", 1);
	        		return "/main";
	        	}
	        }
	    }else if(email == null){
	    	return "/user/joinForm";
	    }
        return "/main";
    }
    
    //移댁뭅�삤 濡쒓렇�씤
  	@RequestMapping("/kakao")
  	public String login(@RequestParam("code") String code, Model model, HttpServletRequest request) {
  		String access_Token = service.getAccessToken(code);
  		System.out.println("/////�넗�겙////"+access_Token);
  	    String email = service.getUserInfo(access_Token);
  		System.out.println("�씠硫붿씪------" + email);
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
  	        	//媛��엯���엯�쓣 寃��궗�빐�꽌 N�씠硫� 濡쒓렇�씤 �븘�땲硫� �떎瑜멸구濡� 媛��엯�뻼�쓬
  	        	String join = service.join_type(email);
  	        	System.out.println(join);
  	        	if(join.equals("K")) {
  	        		session.setAttribute("memId", email);
  			        session.setAttribute("access_Token", access_Token);
  		        	return "/main";
  	        	}else {
  	        		model.addAttribute("warn", 1);
  	        		return "/main";
  	        	}
  	        }
  	    }else if(email == null){
  	    	return "/user/joinForm";
  	    }
          return "/main";
    }
  		
	//援ш� 濡쒓렇�씤
  	@RequestMapping("/google")
  	public String google(Model model, HttpServletRequest request) throws IOException {
		String googleLoginUrl = "https://accounts.google.com/o/oauth2/auth" +
		          "?client_id=" + "694729335668-knpidd602057l2ovrvk6qpqhqeub7b6c.apps.googleusercontent.com" +
		          "&redirect_uri=" + "http://localhost:8080/whou/member/googleLog" +
		          "&response_type=code" +
		          "&scope=email profile";
		System.out.println("援ш� 嫄곗퀜媛�");
		return "redirect:" + googleLoginUrl;
	}
  	
  	//援ш� 濡쒓렇�씤�봽濡�
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

              // �젒洹� �넗�겙 媛��졇�삤湲�
              String accessToken = tokenResponse.getAccessToken();
              System.out.println(accessToken);
              
              // �젒洹� �넗�겙�쑝濡� �젙蹂� 媛��졇�삤湲�
              ResponseEntity<String> json = service.getInfo(accessToken);
              System.out.println(json);
              
              // �쉶�썝 �젙蹂� �뙆�떛
              JsonParser jsonParser = new JsonParser();
              JsonObject jsonObject = jsonParser.parse(json.getBody()).getAsJsonObject();

              String email = jsonObject.get("email").getAsString();
              
              //�꽭�뀡 �깮�꽦
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
	      	        	//媛��엯���엯�쓣 寃��궗�빐�꽌 N�씠硫� 濡쒓렇�씤 �븘�땲硫� �떎瑜멸구濡� 媛��엯�뻼�쓬
	      	        	String join = service.join_type(email);
	      	        	if(join.equals("G")) {
	      	        		session.setAttribute("memId", email);
	      			        session.setAttribute("access_Token", accessToken);
	      		        	return "/main";
	      	        	}else {
	      	        		model.addAttribute("warn", 1);
	      	        		return "/main";
	      	        	}
	      	      }
	      	  }else if(email == null){
	      	    	return "/user/joinForm";
	      	  }
	              return "/main"; // �씤利앹씠 �꽦怨듯븳 寃쎌슦 由щ뵒�젆�뀡�븷 �럹�씠吏�
	       } catch (IOException e) {
	              // �삁�쇅 泥섎━
	              return "redirect:/error"; // �씤利앹씠 �떎�뙣�븳 寃쎌슦 由щ뵒�젆�뀡�븷 �럹�씠吏�
	       }
  	}
  	//以묐났�솗�씤 & 異붽��젙蹂�
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
  	    	System.out.println(dto.getBirth_year());
  	    	service.insertPro(dto);
  		  	service.insert2(dto.getEmail());
  	        session.setAttribute("memId", dto.getEmail());
  	    }
  	    System.out.println(result);
  	    return result;
  	}
  	
  	@RequestMapping("/telChk")
  	public @ResponseBody String telChk(String tel) {
        Random rand  = new Random(); //�옖�뜡�닽�옄 �깮�꽦�븯湲� !!
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
        System.out.println(result);
        return result;
    }
  
}
