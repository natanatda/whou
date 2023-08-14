package whou.secproject.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;
import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.TestReinforcementDTO;
import whou.secproject.component.UserInfoDTO;
import whou.secproject.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	//북마크 변경
	@Override
	public void updateBook(String job_cd, String memId, boolean contain) {
		String temp = mapper.getBook(memId);
		if (temp == null) {
			temp = "";
		}
		
		String books="";

		if (contain) {
			ArrayList<String> list = new ArrayList<String>();
			StringTokenizer st = new StringTokenizer(temp, ",");
			while(st.hasMoreTokens()) {
				String token = st.nextToken();
				if(!token.equals(job_cd)) list.add(token);
			}
			for(String s : list) books+= s+",";
		} else {
			books = temp + job_cd + ",";
		}
		mapper.updateBook(memId, books);
	}
	

	
	
	// 북마크 직업 정보 가져오기
	@Override
	public Job_infoDTO getJob(int job_cd) {
		return mapper.getJob(job_cd);
	}


	// 마이페이지 rank 검색
	@Override
	public RecommandInfoDTO getAptitudeRank(int userNum) {
		return mapper.getAptitudeRank(userNum);
	}

	// 가입했는지 확인
	@Override
	public int count(String tel) {
		return mapper.count(tel);
	}

	// 가입했는지 확인
	@Override
	public int check(String email) {
		return mapper.check(email);
	}
	
	// 회원번호 가져오기
	@Override
	public int num(String email) {
		return mapper.num(email);
	}

	// 가입타입이 맞는지 확인
	@Override
	public String join_type(String email) {
		return mapper.join_type(email);
	}
	
	// user_info테이블에 추가
	@Override
	public void insert2(String email, int num) {
		mapper.insert2(email, num);
	}

	// whou_user테이블에 추가
	@Override
	public void insertPro(MemberDTO dto) {
		mapper.insertPro(dto);
	}

	// 로그인시 pw비교(pw찾기)
	@Override
	public String login(String email) {
		return mapper.login(email);
	}

	// 이메일 찾기
	@Override
	public String getEmail(String name, String tel) {
		return mapper.getEmail(name, tel);
	}

	
	//추가정보//
	@Override
	public List<String> getCerti(String certi) { //자격증 가져오기
		return mapper.getCerti(certi);
	}

	@Override
	public List<String> getMajor(String major, String univSe) { //학과 가져오기
		return mapper.getMajor(major, univSe);
	}

	@Override
	public void updateInfo(List<String> certiList, List<String> majorList, String memId) { //추가정보 db에 넣기
		String certi = mapper.getUserCerti(memId); //db에 저장된 자격증 가져오기
		String major = mapper.getUserMajor(memId); //db에 저장된 학과 가져오기
		
		
		
		Set<String> CertiSet = new HashSet<>();
		Set<String> MajorSet = new HashSet<>();
		
		CertiSet.addAll(certiList);
		MajorSet.addAll(majorList);
		
		String certiArr[] = new String[30];
		String majorArr[] = new String[5];
				
		if(certi!=null) {
			certiArr = certi.split(",");
		}else {
			certi = "";
			certiArr = certi.split(",");

		}
		
		
		if(major!=null) {
			majorArr = major.split(",");
		}else {
			major ="";
			majorArr = major.split(",");
		}
		
		
		
		for(String arrC : certiArr) {
			CertiSet.add(arrC);
		}
		
		
		for(String arrM : majorArr) {
			MajorSet.add(arrM);
		}
		
		String combinedCerti = String.join(",", CertiSet );
		String combinedMajor = String.join(",", MajorSet);
		
		
		mapper.updateInfo(combinedCerti, combinedMajor, memId);
	}
	
	//회원정보수정//
	@Override
	public MemberDTO getUser(int userNum) { // 회원정보 가져오기
		return mapper.getUser(userNum);
	}
	
	@Override
	public UserInfoDTO userInfo(int userNum) { // 추가 회원정보 가져오기
		return mapper.userInfo(userNum);
	}
	
	@Override
	public void updateUser(MemberDTO dto) {
		mapper.updateUser(dto);
	}
	
	@Override
	public void updatePw(String pw, String memId) {
		mapper.updatePw(pw, memId);
	}
	
	// 학과 제거
	@Override
	public void deleteMajor(String major, String memId) {
		String temp = mapper.getUserMajor(memId); //db에 저장된 학과 가져오기
		String db="";
		ArrayList<String> list = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(temp, ",");
		while(st.hasMoreTokens()) {
			String token = st.nextToken();
			if(!token.equals(major)) list.add(token);
		}
		for(String s : list) db+= s+",";
		
		mapper.deleteMajor(memId, db);
	}
	
	// 자격증 제거
	@Override
	public void deleteCerti(String certi, String memId) {
		String temp = mapper.getUserCerti(memId); //db에 저장된 학과 가져오기
		String db="";
		ArrayList<String> list = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(temp, ",");
		while(st.hasMoreTokens()) {
			String token = st.nextToken();
			if(!token.equals(certi)) list.add(token);
		}
		for(String s : list) db+= s+",";
		
		mapper.deleteCerti(memId, db);
	}
	
	//회원탈퇴
	@Override
	public void dropTest_Result(int UserNum) {
		mapper.dropTest_Result(UserNum);
	}
	@Override
	public void dropTest_Save(int userNum) {
		mapper.dropTest_Save(userNum);
	}
	
	@Override
	public void deleteUser_info(int userNum) {
		mapper.deleteUser_info(userNum);
	}
	@Override
	public void deleteUser(int userNum) {
		mapper.deleteUser(userNum);
	}
	@Override
	public void deleteRecommand_info(int userNum) {
		mapper.deleteRecommand_info(userNum);
	}
	
	@Override
	public void deleteModel(String email) {
		mapper.deleteModel(email);
	}
	
	
//	//네이버 회원탈퇴
//	@Override
//	public String requestToServer(String apiURL) throws IOException {
//	    return requestToServer(apiURL, null);
//	}
//	
//	@Override
//	public String requestToServer(String apiURL, String headerStr) throws IOException {
//	    URL url = new URL(apiURL);
//	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
//	    con.setRequestMethod("GET");
//	    if(headerStr != null && !headerStr.equals("") ) {
//	      con.setRequestProperty("Authorization", headerStr);
//	    }
//	    int responseCode = con.getResponseCode();
//	    BufferedReader br;
//	    if(responseCode == 200) { // 정상 호출
//	      br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//	    } else {  // 에러 발생
//	      br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//	    }
//	    String inputLine;
//	    StringBuffer res = new StringBuffer();
//	    while ((inputLine = br.readLine()) != null) {
//	      res.append(inputLine);
//	    }
//	    br.close();
//	    if(responseCode==200) {
//	    	String new_res=res.toString().replaceAll("&#39;", "");
//			 return new_res; 
//	    } else {
//	      return null;
//	    }
//	  }
//	
	@Override
	public String Nremove(String access_Token) {
		String reqURL = "https://nid.naver.com/oauth2.0/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=delete");
			sb.append("&client_id=QWYmFRRrJidAIVICUYXk");
			sb.append("&client_secret=SjbYDHwrH9");
			sb.append("&access_token="+access_Token);
			sb.append("service_provider=NAVER");
			bw.write(sb.toString());
			bw.flush();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// 카카오 로그인시 토큰 생성
	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=7411fb12b3136c342fa5bfeca89cc0d2");
			sb.append("&redirect_uri=http://localhost:8080/whou/member/kakao");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();


			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// 카카오 사용자 동의정보 파싱
	@Override
	public String getUserInfo(String access_Token) {

		String email = null;
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			if (element.getAsJsonObject().has("kakao_account")) {
				JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

				// element에 이메일이 있는지 확인 - 사용자가 선택동의를 안해주면 email이 없음
				if (kakaoAccount.has("email")) {
					email = kakaoAccount.get("email").getAsString();
					// 이메일 값 처리 또는 반환
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		return email;
	}

	// 구글 회원정보 불러오기
	@Override
	public ResponseEntity<String> getInfo(String ACCESS_TOKEN) throws IOException {
		HttpTransport httpTransport = new NetHttpTransport();
		JsonFactory jsonFactory = new JacksonFactory();
		GoogleCredential credential = new GoogleCredential().setAccessToken(ACCESS_TOKEN);
		HttpRequestFactory requestFactory = httpTransport.createRequestFactory(credential);

		GenericUrl url = new GenericUrl("https://www.googleapis.com/oauth2/v3/userinfo");
		HttpRequest request = requestFactory.buildGetRequest(url);
		HttpResponse response = request.execute();

		String json = response.parseAsString();
		return ResponseEntity.ok(json);
	}

	// 휴대폰번호 인증
	@Override
	public void telChk(String tel, String numStr) {
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCS4XRPYVUNL7XQ8",
				"72A0UQWSG2MFLWJRXZYARI2AU1ARQWVM", "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01093501996");
		message.setTo(tel);
		message.setText("[whoU] 인증번호 " + "[" + numStr + "]" + " 를 입력하세요.");

		try {
			// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		} catch (Exception exception) {
		}

	}
	
	public Integer getCunsultingNum(int user_info_num){ // user_info의 num을 이용하여 cunsulting_num 컬럼 값 get
		return mapper.getCunsultingNum(user_info_num);
	}
	public String getRecentTest21(int userNum) { //역량 보완법을 위해 크롤링한 결과에서 21번 테스트의 역량별 수치 가져옴
		return mapper.getRecentTest21(userNum);
	}
	public TestReinforcementDTO getTestReinforcement(int num) { // 역량 보완법 가져옴
		return mapper.getTestReinforcement(num);
	}
	public String getTempSave(String memId) {
		return mapper.getTempSave(memId);
	}
	
	public int level(String email) {
		return mapper.level(email);
	}
	// 관리자 회원가입
	@Override
	public void adminInsert(MemberDTO dto) {
		mapper.adminInsert(dto);
	}
	// 관리자 리스트
	@Override
	public List<MemberDTO> getAdmin() {
		return mapper.getAdmin();
	}
	// 관리자 삭제
	@Override
	public void deleteAdmin(String email) {
		mapper.deleteAdmin(email);
	}
}
