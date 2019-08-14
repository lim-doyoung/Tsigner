package com.bit.tsigner;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class kakao_restapi {
	
	//로그인
	public JsonNode getAccessToken(String autorize_code) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
 
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
 
        postParams.add(new BasicNameValuePair("client_id", "cf59d8cf164537ca58f158a8dcd3c7f4"));
 
        postParams.add(new BasicNameValuePair("redirect_uri", "http://192.168.1.8:8080/tsigner/oauth"));
 
        postParams.add(new BasicNameValuePair("code", autorize_code));
 
        final HttpClient client = HttpClientBuilder.create().build();
 
        final HttpPost post = new HttpPost(RequestUrl);
 
        JsonNode returnNode = null;
 
        try {
 
            post.setEntity(new UrlEncodedFormEntity(postParams));
 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
        } catch (UnsupportedEncodingException e) {
 
            e.printStackTrace();
 
        } catch (ClientProtocolException e) {
 
            e.printStackTrace();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        } finally {
 
        }
 
        return returnNode;
 
    }


	//로그아웃
	public JsonNode Logout(String autorize_code) {
        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
 
        final HttpClient client = HttpClientBuilder.create().build();
 
        final HttpPost post = new HttpPost(RequestUrl);
 
        post.addHeader("Authorization", "Bearer " + autorize_code);
 
        JsonNode returnNode = null;
 
        try {
 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
 
            e.printStackTrace();
 
        } catch (ClientProtocolException e) {
 
            e.printStackTrace();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        } finally {
 
        }
 
        return returnNode;
 
    }

	//사용자 정보요청
	public static JsonNode getKakaoUserInfo(String autorize_code) {

		

		 final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

		    

		    String CLIENT_ID = "cf59d8cf164537ca58f158a8dcd3c7f4"; // REST API KEY

		    String REDIRECT_URI = "http://192.168.1.8:8080/tsigner/oauth"; // 리다이렉트 URI

		    String code = autorize_code; // 로그인 과정중 얻은 토큰 값



		    final HttpClient client = HttpClientBuilder.create().build();

		    final HttpPost post = new HttpPost(RequestUrl);

		    

		    // add header

		    post.addHeader("Authorization", "Bearer " + autorize_code);
		    

		    JsonNode returnNode = null;

		    

		    try {

		      final HttpResponse response = client.execute(post);

		      final int responseCode = response.getStatusLine().getStatusCode();



		      System.out.println("\nSending 'POST' request to URL : " + RequestUrl);

		      System.out.println("Response Code : " + responseCode);



		      //JSON 형태 반환값 처리

		      ObjectMapper mapper = new ObjectMapper();

		      returnNode = mapper.readTree(response.getEntity().getContent());

		      

		    } catch (UnsupportedEncodingException e) {

		      e.printStackTrace();

		    } catch (ClientProtocolException e) {

		      e.printStackTrace();

		    } catch (IOException e) {

		      e.printStackTrace();

		    } finally {


		    }

		    return returnNode;

		}
	        

	
}
