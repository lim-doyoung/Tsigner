package com.bit.tsigner.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping(value = "/notice")
	public String notice(Model model) throws IOException {

		String result="";
		BufferedReader br = null;
		try{            
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey="
					+ "KfXhi9dUVMlKuLkdbJrb%2FOISpQpVlvqXua7%2Bkh9LFQJgEhhIjL8WTssH37md%2FTG6jLMlogG5FP3HzDqiHSXK6w%3D%3D"
					+ "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&_type=json";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String line;
			while((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			System.out.println(result);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}


		String data = result;
		System.out.println(data);

		JSONObject json = new JSONObject();
		json.put("data", data);

		model.addAttribute("json", json);

		return "notice";
	}



}
