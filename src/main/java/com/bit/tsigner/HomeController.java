package com.bit.tsigner;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.naver.NaverLoginBO;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class HomeController {
	
	//카카오톡
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private kakao_restapi kakao_restapi = new kakao_restapi();

	//네이버
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("메인화면 로그");
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);

		
		return "home";
	}
	
	//카카오톡 로그인
	@RequestMapping(value = "/oauth", produces = "application/json")
    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {

		System.out.println("로그인 할때 임시 코드값");
        //카카오 홈페이지에서 받은 결과 코드
        System.out.println(code);
        System.out.println("로그인 후 결과값");
        
      //카카오 rest api 객체 선언
        kakao_restapi kr = new kakao_restapi();
        //결과값을 node에 담아줌
        JsonNode node = kr.getAccessToken(code);
        //결과값 출력
        System.out.println(node);
        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
        String token = node.get("access_token").toString();
        System.out.println("token : "+token);
        //세션에 담아준다.
        session.setAttribute("token", token);
        System.out.println("세션: "+session.getAttribute("token"));
        
        //사용자 정보요청
        JsonNode userInfo = kr.getKakaoUserInfo(token);
        System.out.println("userinfo : "+userInfo);
        

        // Get id

 		String id = userInfo.path("id").asText();

 		String nickname = null;

 		// Get email
 		String email = null;
 		
 		String age = null;
 		
 		String birthday=null;
 		
 		String gender=null;

        // 유저정보 카톡에서 가져오기 Get properties

		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		if (properties.isMissingNode()) {

			// if "name" node is missing

		} else {

			nickname = properties.path("nickname").asText();

			email = kakao_account.path("email").asText();
			
			age = kakao_account.path("age_range").asText();
			
			birthday = kakao_account.path("birthday").asText();
			
			gender = kakao_account.path("gender").asText();
			
			System.out.println("id : " + id);
			
			System.out.println("email : "+email);
			
			System.out.println("nickname : " + nickname);
			
			System.out.println("age : " + age);
			
			System.out.println("birthday : " + birthday);
			
			System.out.println("gender : " + gender);

		}
		
		
        
        
        return "logininfo";

    }
	
	//카카오톡 로그아웃
	@RequestMapping(value = "/logout", produces = "application/json")
    public String Logout(HttpSession session) {
        //kakao restapi 객체 선언
        kakao_restapi kr = new kakao_restapi();
        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
        JsonNode node = kr.Logout(session.getAttribute("token").toString());
        //결과 값 출력
        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
        return "redirect:/";
    }    

	//토큰뽑아오기
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		System.out.println(oauthToken);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		String email = (String)response_obj.get("email");
		String name = (String)response_obj.get("name");
		System.out.println(email);
		System.out.println(name);
		//4.파싱 닉네임 세션으로 저장
//		session.setAttribute("sessionId",nickname); //세션 생성
//		model.addAttribute("result", apiResult);
		return "redirect:/";
	}

	

}
