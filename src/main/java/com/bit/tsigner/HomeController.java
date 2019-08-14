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
	
	//īī����
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private kakao_restapi kakao_restapi = new kakao_restapi();

	//���̹�
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("����ȭ�� �α�");
		
		/* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("���̹�:" + naverAuthUrl);
		//���̹�
		model.addAttribute("url", naverAuthUrl);

		
		return "home";
	}
	
	//īī���� �α���
	@RequestMapping(value = "/oauth", produces = "application/json")
    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {

		System.out.println("�α��� �Ҷ� �ӽ� �ڵ尪");
        //īī�� Ȩ���������� ���� ��� �ڵ�
        System.out.println(code);
        System.out.println("�α��� �� �����");
        
      //īī�� rest api ��ü ����
        kakao_restapi kr = new kakao_restapi();
        //������� node�� �����
        JsonNode node = kr.getAccessToken(code);
        //����� ���
        System.out.println(node);
        //��� �ȿ� �ִ� access_token���� ���� ���ڿ��� ��ȯ
        String token = node.get("access_token").toString();
        System.out.println("token : "+token);
        //���ǿ� ����ش�.
        session.setAttribute("token", token);
        System.out.println("����: "+session.getAttribute("token"));
        
        //����� ������û
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

        // �������� ī�忡�� �������� Get properties

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
	
	//īī���� �α׾ƿ�
	@RequestMapping(value = "/logout", produces = "application/json")
    public String Logout(HttpSession session) {
        //kakao restapi ��ü ����
        kakao_restapi kr = new kakao_restapi();
        //��忡 �α׾ƿ��� ������� ����� �Ű������� ���ǿ� �մ� token�� ������ ���ڿ��� ��ȯ
        JsonNode node = kr.Logout(session.getAttribute("token").toString());
        //��� �� ���
        System.out.println("�α��� �� ��ȯ�Ǵ� ���̵� : " + node.get("id"));
        return "redirect:/";
    }    

	//��ū�̾ƿ���
	//���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		System.out.println(oauthToken);
		//1. �α��� ����� ������ �о�´�.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String������ json������
		/** apiResult json ����
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String������ apiResult�� json���·� �ٲ�
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. ������ �Ľ�
		//Top���� �ܰ� _response �Ľ�
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response�� nickname�� �Ľ�
		String nickname = (String)response_obj.get("nickname");
		String email = (String)response_obj.get("email");
		String name = (String)response_obj.get("name");
		System.out.println(email);
		System.out.println(name);
		//4.�Ľ� �г��� �������� ����
//		session.setAttribute("sessionId",nickname); //���� ����
//		model.addAttribute("result", apiResult);
		return "redirect:/";
	}

	

}
