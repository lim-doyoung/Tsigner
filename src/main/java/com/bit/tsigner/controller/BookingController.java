package com.bit.tsigner.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.tsigner.service.BookingService;


@Controller
public class BookingController {
	@Inject
	BookingService bookingService;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	
	@RequestMapping(value = "/booking")
	public String booking(Model model) throws SQLException, IOException {
		logger.debug("부킹페이지");
		String data = room(1);
		model.addAttribute("data", data);
		
		return "booking/booking";
	}
	
	
	public String room(int idx) throws IOException {
		String result="";
		BufferedReader br = null;
		try{            
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey="
					+ "KfXhi9dUVMlKuLkdbJrb%2FOISpQpVlvqXua7%2Bkh9LFQJgEhhIjL8WTssH37md%2FTG6jLMlogG5FP3HzDqiHSXK6w%3D%3D"
					+ "&areaCode=1"
					+ "&listYN=Y"
					+ "&MobileOS=ETC"
					+ "&MobileApp=Tsigner"
					+ "&arrange=A"
					+ "&numOfRows=12"
					+ "&pageNo="+idx
					+ "&_type=json";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String line;
			while((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			//System.out.println(result);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}

		String data = result;
		return data;
	}
	
	@GetMapping(value = "roomDetail")
	public String roomDetail(Model model,@RequestParam("id") String id,@RequestParam("type") String type) {
		
		String result="";
		BufferedReader br = null;
		try{            
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?serviceKey="
					+ "KfXhi9dUVMlKuLkdbJrb%2FOISpQpVlvqXua7%2Bkh9LFQJgEhhIjL8WTssH37md%2FTG6jLMlogG5FP3HzDqiHSXK6w%3D%3D"
					+ "&contentTypeId="+type
					+ "&contentId="+id
					+ "&MobileOS=ETC"
					+ "&MobileApp=Tsigner"
					+ "&defaultYN=Y"
					+ "&firstImageYN=Y"
					+ "&areacodeYN=Y"
					+ "&catcodeYN=Y"
					+ "&addrinfoYN=Y"
					+ "&mapinfoYN=Y"
					+ "&overviewYN=Y"
					+ "&transGuideYN=Y"
					+ "&_type=json";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String line;
			while((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			//System.out.println(result);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}

		String data = result;
		model.addAttribute("data", data);
		
		return "booking/roomDetail";
	}
	
	@RequestMapping(value = "/bookingRoom")
	public String bookingRoom(Model model, @RequestParam("idx") int num) throws SQLException, IOException {
		logger.debug("부킹페이지");
		String data = room(num);
		model.addAttribute("data", data);
		
		return "booking/booking";
	}
	////////////////////////////////
}
