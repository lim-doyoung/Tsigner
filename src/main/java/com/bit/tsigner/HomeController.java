package com.bit.tsigner;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.bit.naver.NaverLoginBO;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.service.KaKaoAPI;
import com.bit.tsigner.service.LoginService;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class HomeController {

	@Inject
	LoginService loginService;
	
	//카카오톡
	@Autowired
	private KaKaoAPI kakao;
	
	
	//mail 전송을 위한 세팅
	@Autowired
	private Mail mail;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//네이버
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;

	String id="";
	String name="";
	String email="";
	String nickName="";
	String sns="";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("메인화면 로그");
//		model.addAttribute("sns",sns);
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("네이버:" + naverAuthUrl);
		//네이버
//		model.addAttribute("url", naverAuthUrl);

		
		return "home";
	}
	
	
	//일반 로그인
	@RequestMapping (value = "/loginUser")
	public void loginResult(@RequestParam("id") String id , @RequestParam("pw") String pw, HttpSession session, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		LoginVo bean=new LoginVo();
		
		if((loginService.login(map))==null) {
			res.getWriter().write("logFail");
			logger.debug("실패");
		}else {
			logger.debug("성공");
			bean = loginService.login(map);
			session.setAttribute("id", bean.getUser_id());
			session.setAttribute("nickName", bean.getUser_nick_name());
		}
	}
	//together 로그인
	@RequestMapping (value = "/community_togetherDetail/loginUser")
	public void togetherLoginResult(@RequestParam("id") String id , @RequestParam("pw") String pw, HttpSession session, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		LoginVo bean=new LoginVo();
		
		if((loginService.login(map))==null) {
			res.getWriter().write("logFail");
			logger.debug("실패");
		}else {
			logger.debug("성공");
			bean = loginService.login(map);
			session.setAttribute("id", bean.getUser_id());
			session.setAttribute("nickName", bean.getUser_nick_name());
		}
	}
	
	//로그아웃
	@RequestMapping (value = "/logoutUser")
	public void logoutUser(HttpSession session,HttpServletResponse res) throws IOException {
		//kakao 로그아웃
		if(kakao.kakaoLogout((String)session.getAttribute("access_Token"))) {
			session.removeAttribute("access_Token");
			session.removeAttribute("id");
//			session.removeAttribute("nickName");
			res.getWriter().write("kakaoLogout");
		}
		//일반, Naver 로그아웃
		else {
			session.invalidate();
			res.getWriter().write("logoutSuccess");
		}
	}
	//together detail에서 로그아웃할떄
	@RequestMapping (value = "/community_togetherDetail/logoutUser")
	public void togetherLogoutUser(HttpSession session,HttpServletResponse res) throws IOException {
		//kakao 로그아웃
		if(kakao.kakaoLogout((String)session.getAttribute("access_Token"))) {
			session.removeAttribute("access_Token");
			session.removeAttribute("id");
//			session.removeAttribute("nickName");
			res.getWriter().write("kakaoLogout");
		}
		//일반, Naver 로그아웃
		else {
			session.invalidate();
			res.getWriter().write("logoutSuccess");
		}
	}
	
	//일반 회원가입
	@RequestMapping(value = "joinUser")
	public void joinUser(@RequestParam("id") String id,@RequestParam("pw") String pw,@RequestParam("userName") String userName,
			@RequestParam("nickName") String nickName,@RequestParam("email") String email,@RequestParam("tel") String tel,
			@RequestParam("birth") String birth,@RequestParam("gender") String gender, HttpServletResponse res) throws Exception {
		logger.debug("회원가입 실행");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("userName", userName);
		map.put("nickName", nickName);
		map.put("email", email);
		map.put("tel", tel);
		map.put("birth", birth);
		map.put("gender", gender);
		
		loginService.join(map);
		loginService.join_level_mgt(map);
	}
	
	//아이디 중복검사
	@RequestMapping (value = "idCheck")
	public void idCheck(@RequestParam("id") String id, HttpServletResponse res) throws Exception {
		logger.debug("중복검사");
		if(!(loginService.idCheck(id)==null)) {
			res.getWriter().write("fail");
		}else {
			res.getWriter().write("success");
		}
		
	}
	
	Map<String, Object> res= new HashMap<String, Object>(); 
	int checkNum =0;
	
	//인증 메일 전송 및 메일 중복 검사
	@RequestMapping(value = "mailCheck")
	public void mailCheck(@RequestParam("email") String email,HttpServletResponse res) throws Exception {
		
		if(loginService.emailCheck(email)==null) {
			logger.debug(loginService.emailCheck(email));
			double ran = Math.random();
			this.checkNum=(int)(ran*100000);
			this.res.put("check"+email, checkNum);
			try {
				res.getWriter().write("success");;
				mail.sendMail(email, "T-signer 인증메일입니다.", "인증번호입니다\r\n"+checkNum);
			}catch(Exception e) {
				res.getWriter().write("fail");
			}
		}else {
			res.getWriter().write("mailDupli");
		}
		
	}
	
	//인증 메일 확인
	@RequestMapping(value = "mailResult")
	public void mailResult(@RequestParam("checkEmail") String check, @RequestParam("email") String email, HttpServletResponse res) throws IOException {
		if(this.res.get("check"+email)!=null) {
			//테스트용입니다.
			logger.debug("인증번호"+(this.res.get("check"+email).toString()));
			if(check.equals(this.res.get("check"+email).toString())) {
				res.getWriter().write("success");
			}else {
				res.getWriter().write("fail");
			}
		}
	}
	
	////////
	

	
	
	//id검색
	@RequestMapping(value = "searchId")
	public void serachId(@RequestParam("name") String name, @RequestParam("email") String email, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		//logger.debug(loginService.searchId(map));
		String result=""; 
		if(!(loginService.searchId(map).isEmpty())) {
			result=loginService.searchId(map);
			res.getWriter().write(result);
		}else {
			res.getWriter().write("fail");
		}
		
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "searchPw")
	public void serachPw(@RequestParam("id") String id, @RequestParam("email") String email, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
	
		if(loginService.searchPw(map)) {
			res.getWriter().write("success");
		}else {
			res.getWriter().write("fail");
		}
		//logger.debug((loginService.searchPw(map).toString()));
	}
	
	//비밀번호 변경
	@RequestMapping(value = "editPw")
	public void editPw(@RequestParam("id") String id, @RequestParam("email") String email, @RequestParam("editPw") String pw, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		map.put("editPw", pw);
		
		res.getWriter().write("success");
		loginService.editPw(map);
	}
//	//토큰뽑아오기
//	//네이버 로그인 성공시 callback호출 메소드
//	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
//	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
//		OAuth2AccessToken oauthToken;
//		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		System.out.println(oauthToken);
//		//1. 로그인 사용자 정보를 읽어온다.
//		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
//		/** apiResult json 구조
//		{"resultcode":"00",
//		"message":"success",
//		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
//		**/
//		//2. String형식인 apiResult를 json형태로 바꿈
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(apiResult);
//		JSONObject jsonObj = (JSONObject) obj;
//		//3. 데이터 파싱
//		//Top레벨 단계 _response 파싱
//		JSONObject response_obj = (JSONObject)jsonObj.get("response");
//		//response의 nickname값 파싱
//		String nickname = (String)response_obj.get("nickname");
//		String email = (String)response_obj.get("email");
//		String name = (String)response_obj.get("name");
//		System.out.println(email);
//		System.out.println(name);
//		//4.파싱 닉네임 세션으로 저장
////		session.setAttribute("sessionId",nickname); //세션 생성
////		model.addAttribute("result", apiResult);
//		return "redirect:/";
//	}
	
	//카카오 로그인
	@RequestMapping(value = "kakao")
	public String kakao(@RequestParam("code") String code, HttpSession session) throws Exception {
		logger.debug("카카오 접속 : "+code);
		String access_Token = kakao.getAccessToken(code);	//카카오 api를 불러와 access토큰을 받음
		HashMap<String, Object> userInfo = kakao.getKakaoInfo(access_Token);
		System.out.println("login Controller : "+userInfo);
		
		if(userInfo.get("email")!=null) {
			session.setAttribute("nickNameN", userInfo.get("nickName"));
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("idN", userInfo.get("id"));
			session.setAttribute("emailN", userInfo.get("email"));
			
			if(loginService.emailCheck((userInfo.get("email").toString()))!=null) {
				session.setAttribute("sns", "none");
			}else{
				session.setAttribute("sns", "sns");
				session.setAttribute("type", "kakao");
			}
			
		}
		return "redirect:/";
	}
	
	//네이버 로그인
	public String getAccessToken(String res) {
		String access_Token ="";
//		String refresh_Token ="";
		JsonParser parser = new JsonParser();
		JsonElement ele = parser.parse(res);
		access_Token = ele.getAsJsonObject().get("access_token").getAsString();	//access 토큰 받아오기
//		refresh_Token = ele.getAsJsonObject().get("refresh_token").getAsString();	//refresh 토큰 받아오기
		
//		logger.debug(access_Token);
		return access_Token;
	}
	
	
	@RequestMapping(value = "naverLogin")
	public String naver(Model model,HttpServletRequest request, HttpSession session, HttpServletResponse resp) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String clientId = "S1ExXuozTffAz6EJ7ZL2";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "9xUGJUdIZa";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/tsigner/naverLogin", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    Map<String, Object> map = new HashMap<String, Object>();
//	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.println("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	        System.out.println(res.toString());
	    	//네이버 로그인 계정의 정보를 받아오기
	        String access_Token=getAccessToken(res.toString());
	        String header = "Bearer "+ access_Token;
	        
	        try {
	        	String apiNURL = "https://openapi.naver.com/v1/nid/me";
	        	URL urlN = new URL(apiNURL);
	        	HttpURLConnection connN = (HttpURLConnection) urlN.openConnection();
	        	connN.setRequestMethod("GET");
	        	connN.setRequestProperty("Authorization", header);
	        	int resCode = connN.getResponseCode();
	        	BufferedReader brN;
	        	if(resCode==200) {	//정상호출
	        		brN = new BufferedReader(new InputStreamReader(connN.getInputStream(),"utf-8"));
	        		String input;
		        	StringBuffer response = new StringBuffer();
		        	while((input=brN.readLine())!=null){
		        		response.append(input);
		        		System.out.println("버퍼에서도?"+response);
		        	}
		        	brN.close();
		        	System.out.println("회원정보 가져온 결과"+response.toString());
		        	
		        	JsonParser jParser = new JsonParser();
		        	JsonElement ele1 = jParser.parse(response.toString());
		        	
		        	JsonObject naverRes = ele1.getAsJsonObject().get("response").getAsJsonObject();
					
					String nickName = naverRes.getAsJsonObject().get("nickname").getAsString();
					String email = naverRes.getAsJsonObject().get("email").getAsString();
					String id = naverRes.getAsJsonObject().get("id").getAsString();
					String name = naverRes.getAsJsonObject().get("name").getAsString();
					
					resp.getWriter().write(ele1.toString());
					session.setAttribute("nickNameN", nickName);
					session.setAttribute("idN", id);
					session.setAttribute("emailN", email);
					session.setAttribute("nameN", name);
//					System.out.println(loginService.emailCheck(email));
					//여기서 이메일 체크하고 넘어감
					if(loginService.emailCheck(email)!=null) {
						System.out.println("여기 찍냐");
						session.setAttribute("sns", "none");
					}else{
						session.setAttribute("sns", "sns");
						session.setAttribute("type", "naver");
					}
					
					System.out.println("emailN"+email);
					System.out.println("nickNameN"+nickName);
//					System.out.println("id"+id);
					System.out.println("nameN"+name);
					
					this.id=id;
					this.email=email;
					this.name=name;
					this.nickName=nickName;
					this.sns="naver";
					
	        	}else {	// 에러
	        		brN= new BufferedReader(new InputStreamReader(connN.getErrorStream(),"utf-8"));
	        	}
	        }catch(Exception e) {
	        }
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    return "redirect:/";
	}

	
	
	//간편 회원가입
		@RequestMapping(value = "easyJoin")
		public void easyJoin(@RequestParam("id") String id,@RequestParam("pw") String pw,@RequestParam("userName") String userName, HttpSession session,
				@RequestParam("nickName") String nickName,@RequestParam("email") String email,@RequestParam("snsId") String snsId,@RequestParam("snsType") String type, HttpServletResponse res) throws Exception {
			logger.debug("회원가입 실행");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("pw", pw);
			map.put("userName", userName);
			map.put("nickName", nickName);
			map.put("email", email);
			map.put("snsId", snsId);
			map.put("type", type);
			
			loginService.easyJoin(map);
			loginService.join_level_mgt(map);
			session.invalidate();
		}
		
	//회원 개인정보 페이지
	@RequestMapping(value = "myPage")
	public String myInfo(@RequestParam(value = "id", defaultValue ="null") String id ,Model model) {
		
		LoginVo bean;
		try {
			bean = loginService.getUser(id);
			
			model.addAttribute("id", bean.getUser_id());
			model.addAttribute("name", bean.getUser_name());
			model.addAttribute("nick", bean.getUser_nick_name());
			model.addAttribute("tel", bean.getUser_tel());
			model.addAttribute("birth", bean.getUser_birth());
		
		} catch (Exception e) {
			return "home";
		}
	
		return "myPage";
	}
	
	@RequestMapping(value = "editUser")
	public void editUser(@RequestParam("userName")String name, HttpServletResponse res) throws IOException {
		System.out.println(name);
		res.getWriter().write("fail");
	}
//	
//	//지울 페이지
//	@RequestMapping(value = "sns")
//		public String sns() {
//		
//		return "SNSjoin";
//	}
}
