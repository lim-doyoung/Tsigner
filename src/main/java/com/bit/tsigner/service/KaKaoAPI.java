package com.bit.tsigner.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.tsigner.HomeController;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KaKaoAPI {
	
	Logger logger =  LoggerFactory.getLogger(this.getClass());

	//kakao ������ ��ū�� �޾ƿ��� �޼���
	public String getAccessToken (String authorize_code) {
		String access_Token="";	//1ȸ�� ��ū
		String refresh_Token="";	//��Դ� 2�� ��ȿ�� ��ū
		String reqURL = "https://kauth.kakao.com/oauth/token";	//īī���� ��û�� �ּ�
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	//īī�� url�� �����Ͽ� ��û
			
			conn.setRequestMethod("POST");	//����� POST������� ��û��
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));	// īī���� ��û�Ҷ� �ʿ��� ������ ������.
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=337e2a1093fbc87f1c0fa2bea4366df1");
			sb.append("&redirect_uri=http://localhost:8080/tsigner/kakao");
			//ip �ּ� �ٲ����!
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();	//��ȯ�Ǵ� ���� 200�̸� ����
			String kakaoLogin = "kakao �α��� ��û ��ȯ ��(200 ����) : "+responseCode;
			logger.debug(kakaoLogin);
			
			//��û�� �����ߴٸ� ��û�� ���� ���� �޼��� �о���̱�
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result ="";
			
			//�о���� ���� null�϶����� �о�鿩�� result ��ü�� ������ �����
			while((line = br.readLine())!=null) {
				result += line;
			}
//			System.out.println("��ȯ�� ���� : "+result);
			
			//��ȯ�Ǿ��� �޼����� jsonŸ������ ��ü ����
			JsonParser parser = new JsonParser();
			JsonElement ele = parser.parse(result);
			
			access_Token = ele.getAsJsonObject().get("access_token").getAsString();	//access ��ū �޾ƿ���
			refresh_Token = ele.getAsJsonObject().get("refresh_token").getAsString();	//refresh ��ū �޾ƿ���
			
//			System.out.println("access_Token : "+access_Token);
//			System.out.println("refresh_Token : "+refresh_Token);
			
			br.close();
			bw.close();
		}catch(IOException e) {
			
		}
		return access_Token;
	}
	
	//kakao���� ���� ��ū���� ������ ������ �޾ƿ��� �޼���
	public HashMap<String, Object> getKakaoInfo(String access_Token){
		HashMap<String, Object> kakaoInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";	//��ū�� �����Ͽ� ������ ������ �޾ƿ��� url
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			
			//�ش� ��ū���� kakao���� ������ ��û�Ұǵ� �� ��û�� �ʿ��� Header�� ���Ե� ����
			conn.setRequestProperty("Authorization", "Bearer "+ access_Token);
			
			//��û ��� ��
			int responCode = conn.getResponseCode();
			String KakaoUserRes = "kakaoUser ��û ���(200�� ����) : "+responCode;
			logger.debug(KakaoUserRes);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			
			String line ="";
			String result = "";
			
			while((line=br.readLine())!=null) {
				result+=line;
			}
			System.out.println("user ��û ��� : "+result);
			
			JsonParser parser = new JsonParser();
			JsonElement ele = parser.parse(result);
			
			JsonObject properties = ele.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = ele.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String ninkName = properties.getAsJsonObject().get("nickname").getAsString();
			String id = ele.getAsJsonObject().get("id").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			kakaoInfo.put("nickName", ninkName);
			kakaoInfo.put("id", id);
			kakaoInfo.put("email", email);
			
		}catch(IOException e) {
			logger.debug("kakao User error");
		}
		return kakaoInfo;
	}
	
	//īī�� �α׾ƿ�
	public Boolean kakaoLogout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	        return true;
	    } catch (IOException e) {
	    	logger.debug("�α׾ƿ� ����");
	    }
	    return false;
	}
}
