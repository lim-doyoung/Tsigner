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

	//kakao 유저의 토큰을 받아오는 메서드
	public String getAccessToken (String authorize_code) {
		String access_Token="";	//1회성 토큰
		String refresh_Token="";	//길게는 2주 유효한 토큰
		String reqURL = "https://kauth.kakao.com/oauth/token";	//카카오에 요청할 주소
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	//카카오 url에 접속하여 요청
			
			conn.setRequestMethod("POST");	//방식은 POST방식으로 요청함
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));	// 카카오에 요청할때 필요한 정보를 기입함.
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=337e2a1093fbc87f1c0fa2bea4366df1");
			sb.append("&redirect_uri=http://localhost:8080/tsigner/kakao");
			//ip 주소 바꿔야함!
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();	//반환되는 값이 200이면 성공
			String kakaoLogin = "kakao 로그인 요청 반환 값(200 정상) : "+responseCode;
			logger.debug(kakaoLogin);
			
			//요청이 성공했다면 요청을 통해 얻어온 메세지 읽어들이기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result ="";
			
			//읽어오는 값이 null일때까지 읽어들여서 result 객체에 정보를 담아줌
			while((line = br.readLine())!=null) {
				result += line;
			}
//			System.out.println("반환된 내용 : "+result);
			
			//반환되어진 메세지를 json타입으로 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement ele = parser.parse(result);
			
			access_Token = ele.getAsJsonObject().get("access_token").getAsString();	//access 토큰 받아오기
			refresh_Token = ele.getAsJsonObject().get("refresh_token").getAsString();	//refresh 토큰 받아오기
			
//			System.out.println("access_Token : "+access_Token);
//			System.out.println("refresh_Token : "+refresh_Token);
			
			br.close();
			bw.close();
		}catch(IOException e) {
			
		}
		return access_Token;
	}
	
	//kakao에서 받은 토큰으로 유저의 정보를 받아오는 메서드
	public HashMap<String, Object> getKakaoInfo(String access_Token){
		HashMap<String, Object> kakaoInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";	//토큰을 전송하여 유저의 정보를 받아오는 url
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			
			//해당 토큰으로 kakao에서 정보를 요청할건데 그 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer "+ access_Token);
			
			//요청 결과 값
			int responCode = conn.getResponseCode();
			String KakaoUserRes = "kakaoUser 요청 결과(200이 정상) : "+responCode;
			logger.debug(KakaoUserRes);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			
			String line ="";
			String result = "";
			
			while((line=br.readLine())!=null) {
				result+=line;
			}
			System.out.println("user 요청 결과 : "+result);
			
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
	
	//카카오 로그아웃
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
	    	logger.debug("로그아웃 실패");
	    }
	    return false;
	}
}
