package whou.secproject.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
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
import whou.secproject.component.MemberDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public void updateBook(String job_cd, String memId, boolean contain) {
		String temp = mapper.getBook(memId);
		if (temp == null) {
			temp = "";
		}
		
		String books;

		if (contain) {
			String[] arr = temp.split(",");
			String[] arr2 = new String [arr.length-1];
			for (int i =0 ; i < arr.length; i++) {
				int count = 0;
				if (arr[i].equals(job_cd)) count++;
				if(i-count>-1)arr2[i-count] = arr[i];
			}
			books = String.join(",", arr2)+",";
		} else {
			books = temp + job_cd + ",";
		}
		mapper.updateBook(memId, books);
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

	// 가입타입이 맞는지 확인
	@Override
	public String join_type(String email) {
		return mapper.join_type(email);
	}

	// user_info테이블에 추가
	@Override
	public void insert2(String email) {
		mapper.insert2(email);
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

	@Override
	public List<String> getCerti(String certi) {
		return mapper.getCerti(certi);
	}

	@Override
	public List<String> getMajor(String major, String univSe) {
		return mapper.getMajor(major, univSe);
	}

	@Override
	public void updateInfo(String combinedCerti, String combinedMajor, String memId) {
		mapper.updateInfo(combinedCerti, combinedMajor, memId);
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
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

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
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			System.out.println("==========" + element);

			if (element.getAsJsonObject().has("kakao_account")) {
				JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

				// element에 이메일이 있는지 확인 - 사용자가 선택동의를 안해주면 email이 없음
				if (kakaoAccount.has("email")) {
					email = kakaoAccount.get("email").getAsString();
					System.out.println("Email: " + email);
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
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSGRV3UKNCELVIM",
				"BNYAU0IXAKIDYBDYQKUSN6ZFBHS0DSXV", "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01023492565");
		message.setTo(tel);
		message.setText("[whoU] 인증번호 " + "[" + numStr + "]" + " 를 입력하세요.");

		try {
			// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}

	}

}
