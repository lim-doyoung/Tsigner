package com.bit.tsigner.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.tsigner.service.BookingService;


@Controller
public class BookingController {
	@Inject
	BookingService bookingService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	int area=1;
	
	@RequestMapping(value = "/booking")
	public String booking(Model model) throws SQLException, IOException {
		logger.debug("부킹페이지");
		String data = course(1,1);
		model.addAttribute("data", data);
		
		return "booking/booking";
	}
	
	
	
	public String course(int idx, int areaCode) throws IOException {
		String result="";
		BufferedReader br = null;
		try{            
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
					+ "KfXhi9dUVMlKuLkdbJrb%2FOISpQpVlvqXua7%2Bkh9LFQJgEhhIjL8WTssH37md%2FTG6jLMlogG5FP3HzDqiHSXK6w%3D%3D"
					+ "&contentTypeId=25"
					+ "&areaCode="+areaCode
					+ "&sigunguCode="
					+ "&cat1="
					+ "&cat2="
					+ "&cat3="
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
	

	
	
	@RequestMapping(value = "/bookingCourse")
	public String bookingRoom(Model model, @RequestParam("idx") int num,@RequestParam("region") String sigun) throws SQLException, IOException {
		
		String[] search =sigun.split("시");
		if(search[0].isEmpty()) {
			search[0]="서울";
			search[1]="전체";
		}
		int si=1;
		int gun=1;
		if(search[0].equals("서울")) {
			si=1;
		}else if(search[0].equals("부산")) {
			si=6;
		}else if(search[0].equals("제주")) {
			si=39;
		}
		else if(search[0].equals("인천")) {
			si=2;
		}
		else if(search[0].equals("대전")) {
			si=3;
		}
		else if(search[0].equals("대구")) {
			si=4;
		}
		else if(search[0].equals("광주")) {
			si=5;
		}
		else if(search[0].equals("울산")) {
			si=7;
		}
		else if(search[0].equals("세종특별")) {
			si=8;
		}
		else if(search[0].equals("경기도")) {
			si=31;
		}
		else if(search[0].equals("강원도")) {
			si=32;
		}
		else if(search[0].equals("충청북도")) {
			si=33;
		}
		else if(search[0].equals("충청남도")) {
			si=34;
		}
		else if(search[0].equals("경상북도")) {
			si=35;
		}
		else if(search[0].equals("경상남도")) {
			si=36;
		}
		else if(search[0].equals("전라북도")) {
			si=37;
		}
		else if(search[0].equals("전라남도")) {
			si=38;
		}
		
//		if(search[1].equals("강남")) {
//			gun=1;
//		}else if(search[1].equals("종로")) {
//			gun=23;
//		}else if(search[1].equals("중구")) {
//			gun=24;
//		}else if(search[1].equals("해운대")) {
//			gun=16;
//		}else if(search[1].equals("부산중구")) {
//			gun=15;
//		}else if(search[1].equals("부산진구")) {
//			gun=7;
//		}else if(search[1].equals("서귀포")) {
//			gun=3;
//		}else if(search[1].equals("제주")) {
//			gun=4;
		if(search[1].equals("전체")){
			String data = course(num,si);
			//System.out.println(si);
			model.addAttribute("data",data);
			return "booking/booking";
		}
		
		//System.out.println(search[0]+","+search[1]);
		//System.out.println(si+","+gun);
		String data = course(num,si,gun);
		model.addAttribute("data",data);
		
		return "booking/booking";
	}
	
	
	//////////////////////////////////
	@GetMapping(value = "reCourseList")
	public String sigunRoom(Model model,@RequestParam("region") String sigun) throws IOException {
		String[] search =sigun.split("시");
		int si=1;
		int gun=1;
		
		if(search[0].equals("서울")) {
			si=1;
		}else if(search[0].equals("부산")) {
			si=6;
		}else if(search[0].equals("제주")) {
			si=39;
		}
		else if(search[0].equals("인천")) {
			si=2;
		}
		else if(search[0].equals("대전")) {
			si=3;
		}
		else if(search[0].equals("대구")) {
			si=4;
		}
		else if(search[0].equals("광주")) {
			si=5;
		}
		else if(search[0].equals("울산")) {
			si=7;
		}
		else if(search[0].equals("세종특별")) {
			si=8;
		}
		else if(search[0].equals("경기도")) {
			si=31;
		}
		else if(search[0].equals("강원도")) {
			si=32;
		}
		else if(search[0].equals("충청북도")) {
			si=33;
		}
		else if(search[0].equals("충청남도")) {
			si=34;
		}
		else if(search[0].equals("경상북도")) {
			si=35;
		}
		else if(search[0].equals("경상남도")) {
			si=36;
		}
		else if(search[0].equals("전라북도")) {
			si=37;
		}
		else if(search[0].equals("전라남도")) {
			si=38;
		}
		
//		if(search[1].equals("강남")) {
//			gun=1;
//		}else if(search[1].equals("종로")) {
//			gun=23;
//		}else if(search[1].equals("중구")) {
//			gun=24;
//		}else if(search[1].equals("해운대")) {
//			gun=16;
//		}else if(search[1].equals("부산중구")) {
//			gun=15;
//		}else if(search[1].equals("부산진구")) {
//			gun=7;
//		}else if(search[1].equals("서귀포")) {
//			gun=3;
//		}else if(search[1].equals("제주")) {
//			gun=4;
		if(search[1].equals("전체")){
			String data = course(1,si);
			//System.out.println(si);
			model.addAttribute("data",data);
			return "booking/booking";
		}
		
		//System.out.println(search[0]+","+search[1]);
		//System.out.println(si+","+gun);
		String data = course(1,si,gun);
		model.addAttribute("data",data);
		
		return "booking/booking";
	}
	
	
	public String course(int idx, int areadCode, int sigunguCode) throws IOException {
		String result="";
		BufferedReader br = null;
		try{            
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
					+ "KfXhi9dUVMlKuLkdbJrb%2FOISpQpVlvqXua7%2Bkh9LFQJgEhhIjL8WTssH37md%2FTG6jLMlogG5FP3HzDqiHSXK6w%3D%3D"
					+ "&contentTypeId=25"
					+ "&areaCode="+areadCode
					+ "&sigunguCode="+sigunguCode
					+ "&cat1="
					+ "&cat2="
					+ "&cat3="
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
	
	
	
	////////////////////////////////


	@GetMapping(value = "courseDetail")
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

		
		String result2="";
		BufferedReader br2 = null;
		try{            
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey="
					+ "KfXhi9dUVMlKuLkdbJrb%2FOISpQpVlvqXua7%2Bkh9LFQJgEhhIjL8WTssH37md%2FTG6jLMlogG5FP3HzDqiHSXK6w%3D%3D"
					+ "&contentTypeId="+type
					+ "&contentId="+id
					+ "&MobileOS=ETC"
					+ "&MobileApp=Tsigner"
					+ "&listYN=Y"
					+ "&_type=json";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br2 = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String line;
			while((line = br2.readLine()) != null) {
				result2 = result2 + line + "\n";
			}
			//System.out.println(result);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		String data2=result2;
		model.addAttribute("data2",data2);
		
		return "booking/courseDetail";
	}
	
	@PostMapping(value = "pay")
	public String pay(Model model, @RequestParam("amount") String amount,@RequestParam("name") String name,@RequestParam("payType") String payType) {
		
		model.addAttribute("amount",amount);
		model.addAttribute("name",name);
		model.addAttribute("payType",payType);
		
		return "pay";
	}
	///////////////////////
	//크롤링 연습

	@GetMapping(value = "/hotel")
	public String jsoup(Model model) throws IOException {
		String url="https://www.goodchoice.kr/product/search/2/2012";
		Document doc = Jsoup.connect(url).get();
				
		Elements ele1 = doc.select("div#content");
		Elements ele2 = ele1.select("div.stage.gra_black_vertical");
		
		Elements ele3 = ele2.select("div.price");
		Elements ele4 = ele3.select("div.map_html");

		ArrayList<String> priceList = new ArrayList<String>();
		ArrayList<String> titleList = new ArrayList<String>();
		ArrayList<String> infoList = new ArrayList<String>();
		ArrayList<String> regionList = new ArrayList<String>();
		
		for(Element el: ele4.select("b")) {
			String price=el.text();
			price=price.replace("남은 객실 1개", "");
			price=price.replace("남은 객실 2개", "");
			if(!(price.isEmpty())) {
				priceList.add(price);
			}
		}
		
		
		Elements tit1 = ele1.select("div.name");
		
		for(Element el: tit1.select("p")) {
			infoList.add(el.text());
		}
		
		for(Element el: tit1.select("strong")) {
			String title = el.text(); 
			titleList.add(title);
		}
		
		for(int i=1; i<infoList.size(); i=i+2) {
			regionList.add(infoList.get(i));
		}
		
		model.addAttribute("regionList",regionList);
		
		ArrayList<String> imgs = new ArrayList<String>();
		
		Elements img1 = doc.select("#poduct_list_area li");
		Elements img2 = img1.select(".pic img");
		//System.out.println(img2);
		for(Element el: img2) {
			imgs.add(el.attr("abs:data-original"));
		}
		
	
		
		//detail이 필요한 정보 파싱해오기
		////여기서부터
		Elements date1 = doc.select("#product_filter_form");
		Elements date2 = date1.select("#sel_date");
		Elements dateOut = date1.select("#sel_date2");
		String checkInDate = date2.attr("value");
		String checkOutDate = dateOut.attr("value");
		
//		System.out.println(checkInDate);
//		System.out.println(checkOutDate);
		
		ArrayList<String> idList = new ArrayList<String>();
		ArrayList<String> idList2 = new ArrayList<String>();
		
		Elements id1 = doc.select("#poduct_list_area");
		Elements id2 = id1.select("a[data-ano]");
		
		for(Element el:id2) {
			idList.add(el.attr("data-ano"));
		}
		
		for(Element el:id2) {
			idList2.add(el.attr("data-adcno"));
		}
		
		model.addAttribute("idList",idList);
		model.addAttribute("idList2",idList2);
		model.addAttribute("checkInDate",checkInDate);
		model.addAttribute("checkOutDate",checkOutDate);
		
		////여기까지
		
		model.addAttribute("priceList",priceList);
		model.addAttribute("titleList",titleList);
		model.addAttribute("imgs",imgs);
		
		
		
		return "booking/hotel";
	}
	
	@GetMapping(value = "searchRoom")
	public String roomSearch(Model model, @RequestParam("region") String region,@RequestParam("checkIn") String checkIn,@RequestParam("checkOut") String checkOut,@RequestParam("persons") String persons) throws IOException {
		if(region.equals("서울전체")) {
			region="2/2003";
		}else if(region.equals("강남ㆍ역삼ㆍ삼성ㆍ신사ㆍ청담")) {
			region="2/2012";
		}
		else if(region.equals("서초ㆍ교대")) {
			region="2/2019";
		}
		else if(region.equals("잠실ㆍ송파ㆍ왕십리ㆍ강동")) {
			region="2/2016";
		}
		else if(region.equals("을지로ㆍ시청ㆍ명동")) {
			region="2/2014";
		}
		else if(region.equals("종로ㆍ인사동ㆍ동대문ㆍ강북")) {
			region="2/2015";
		}
		else if(region.equals("서울역ㆍ이태원ㆍ용산")) {
			region="2/2020";
		}
		else if(region.equals("마포ㆍ홍대ㆍ신총ㆍ서대문")) {
			region="2/2018";
		}
		else if(region.equals("영등포ㆍ여의도ㆍ김포공항")) {
			region="2/2017";
		}
		else if(region.equals("구로ㆍ금천ㆍ관악ㆍ동작")) {
			region="2/2021";
		}
		else if(region.equals("부산전체")) {
			region="2/2004";
		}
		else if(region.equals("해운대")) {
			region="2/2041";
		}
		else if(region.equals("광안리ㆍ기장")) {
			region="2/2043";
		}
		else if(region.equals("부산역ㆍ남포ㆍ자갈치ㆍ영도")) {
			region="2/2042";
		}
		else if(region.equals("서면ㆍ동래ㆍ연제ㆍ남구")) {
			region="2/2044";
		}
		else if(region.equals("김해공항ㆍ기타")) {
			region="2/2045";
		}
		else if(region.equals("제주전체")) {
			region="2/2005";
		}
		else if(region.equals("제주공항ㆍ애월ㆍ함덕")) {
			region="2/2051";
		}
		else if(region.equals("서귀포시ㆍ중문ㆍ표선ㆍ성산")) {
			region="2/2052";
		}
		else if(region.equals("강원전체")) {
			region="2/2008";
		}
		else if(region.equals("강릉ㆍ속초")) {
			region="2/2081";
		}
		else if(region.equals("양양ㆍ동해ㆍ고성ㆍ삼척")) {
			region="2/2084";
		}
		else if(region.equals("춘천ㆍ홍천ㆍ인제ㆍ철원")) {
			region="2/2082";
		}
		else if(region.equals("평창ㆍ정선ㆍ횡성")) {
			region="2/2083";
		}
		else if(region.equals("영월ㆍ원주ㆍ태백")) {
			region="2/2085";
		}
		else if(region.equals("경기전체")) {
			region="2/2006";
		}
		else if(region.equals("수원ㆍ성남")) {
			region="2/2061";
		}
		else if(region.equals("용인ㆍ평택")) {
			region="2/2064";
		}
		else if(region.equals("화성ㆍ안산ㆍ부천ㆍ안양")) {
			region="2/2065";
		}
		else if(region.equals("고양ㆍ의정부ㆍ파주ㆍ김포")) {
			region="2/2063";
		}
		else if(region.equals("시흥ㆍ군포ㆍ광명")) {
			region="2/2066";
		}
		else if(region.equals("남양주시ㆍ구리ㆍ하남")) {
			region="2/2067";
		}
		else if(region.equals("가평ㆍ양평")) {
			region="2/2062";
		}
		else if(region.equals("인천전체")) {
			region="2/2007";
		}
		else if(region.equals("송도ㆍ남동구ㆍ옹진군")) {
			region="2/2071";
		}
		else if(region.equals("인천국제공항(중구)")) {
			region="2/2072";
		}
		else if(region.equals("부평ㆍ계양ㆍ서구ㆍ미추홀구ㆍ강화")) {
			region="2/2070";
		}
		else if(region.equals("경상전체")) {
			region="2/2010";
		}
		else if(region.equals("경주ㆍ포항ㆍ울진ㆍ영덕")) {
			region="2/2101";
		}
		else if(region.equals("거제ㆍ통영")) {
			region="2/2103";
		}
		else if(region.equals("대구ㆍ구미ㆍ문경ㆍ안동")) {
			region="2/2102";
		}
		else if(region.equals("울산ㆍ양산")) {
			region="2/2104";
		}
		else if(region.equals("창원ㆍ김해")) {
			region="2/2105";
		}
		else if(region.equals("사천ㆍ남해ㆍ진주ㆍ함양")) {
			region="2/2106";
		}
		else if(region.equals("전라전체")) {
			region="2/2011";
		}
		else if(region.equals("여수")) {
			region="2/2112";
		}
		else if(region.equals("전주")) {
			region="2/2110";
		}
		else if(region.equals("광주")) {
			region="2/2111";
		}
		else if(region.equals("광양ㆍ구례ㆍ순천ㆍ화순ㆍ남원")) {
			region="2/2113";
		}
		else if(region.equals("군산ㆍ익산ㆍ부안ㆍ진안ㆍ무주")) {
			region="2/2114";
		}
		else if(region.equals("목포ㆍ나주ㆍ완도ㆍ해남ㆍ영암")) {
			region="2/2115";
		}
		else if(region.equals("충청전체")) {
			region="2/2009";
		}
		else if(region.equals("대전")) {
			region="2/2093";
		}
		else if(region.equals("천안ㆍ아산ㆍ예산ㆍ당진")) {
			region="2/2095";
		}
		else if(region.equals("보령ㆍ서산ㆍ태안")) {
			region="2/2096";
		}
		else if(region.equals("청주ㆍ제천ㆍ충주ㆍ보은ㆍ금산")) {
			region="2/2094";
		}
		String url="https://www.goodchoice.kr/product/search/"
				+ region
				+ "?sort=HIT"
				+ "&sel_date="+checkIn
				+ "&sel_date2="+checkOut
				+ "&persons="+persons;
		Document doc = Jsoup.connect(url).get();
				
		Elements ele1 = doc.select("div#content");
		Elements ele2 = ele1.select("div.stage.gra_black_vertical");
		
		Elements ele3 = ele2.select("div.price");
		Elements ele4 = ele3.select("div.map_html");

		ArrayList<String> priceList = new ArrayList<String>();
		ArrayList<String> titleList = new ArrayList<String>();
		ArrayList<String> infoList = new ArrayList<String>();
		ArrayList<String> regionList = new ArrayList<String>();
		
		for(Element el: ele4.select("b")) {
			String price=el.text();
			price=price.replace("남은 객실 1개", "");
			price=price.replace("남은 객실 2개", "");
			if(!(price.isEmpty())) {
				priceList.add(price);
			}
		}
		
		
		Elements tit1 = ele1.select("div.name");
		
		for(Element el: tit1.select("p")) {
			infoList.add(el.text());
		}
		
		for(Element el: tit1.select("strong")) {
			String title = el.text(); 
			titleList.add(title);
		}
		
		for(int i=1; i<infoList.size(); i=i+2) {
			regionList.add(infoList.get(i));
		}
		
		model.addAttribute("regionList",regionList);
		
		ArrayList<String> imgs = new ArrayList<String>();
		
		Elements img1 = doc.select("#poduct_list_area li");
		Elements img2 = img1.select(".pic img");
		//System.out.println(img2);
		for(Element el: img2) {
			imgs.add(el.attr("abs:data-original"));
		}
		
	
		
		//detail이 필요한 정보 파싱해오기
		////여기서부터
		Elements date1 = doc.select("#product_filter_form");
		Elements date2 = date1.select("#sel_date");
		Elements dateOut = date1.select("#sel_date2");
		String checkInDate = date2.attr("value");
		String checkOutDate = dateOut.attr("value");
		
//		System.out.println(checkInDate);
//		System.out.println(checkOutDate);
		
		ArrayList<String> idList = new ArrayList<String>();
		ArrayList<String> idList2 = new ArrayList<String>();
		
		Elements id1 = doc.select("#poduct_list_area");
		Elements id2 = id1.select("a[data-ano]");
		
		for(Element el:id2) {
			idList.add(el.attr("data-ano"));
		}
		
		for(Element el:id2) {
			idList2.add(el.attr("data-adcno"));
		}
		
		model.addAttribute("idList",idList);
		model.addAttribute("idList2",idList2);
		model.addAttribute("checkInDate",checkInDate);
		model.addAttribute("checkOutDate",checkOutDate);
		
		////여기까지
		
		model.addAttribute("priceList",priceList);
		model.addAttribute("titleList",titleList);
		model.addAttribute("imgs",imgs);
		
		
		
		return "booking/hotel";
	}
	
	@GetMapping(value = "booking/hotelDetail")
	public String hotelDetail(Model model, @RequestParam("id1") String id1 , @RequestParam("id2") String id2, @RequestParam("date1") String date1, @RequestParam("date2") String date2) throws IOException {
		
		String url="https://www.goodchoice.kr/product/detail"
				+ "?ano="+id1
				+ "&adcno="+id2
				+ "&sel_date="+date1
				+ "&sel_date2="+date2;
		Document doc = Jsoup.connect(url).get();
				
		Elements ele1 = doc.select("div#content");
		//이미지 리스트
		ArrayList<String> thumbList = new ArrayList<String>();
		Elements thumb1 = doc.select("div.gallery_pc");
		Elements thumb2 = thumb1.select("div.gallery-top");
		Elements thumb3 = thumb2.select("img");
		for(Element el: thumb3) {
			thumbList.add(el.attr("data-src"));
		}
		model.addAttribute("thumbList",thumbList);
		
		//제목
		Elements title1 = doc.select("div.right");
		Elements title2 = title1.select("h2");
		Elements title3 = title1.select("p.address");
		Elements title4 = title1.select("div.score_cnt");
		Elements title5 = title4.select("span");

		String hotelTitle=title2.text();
		String hotelAdd=title3.text();
		String hotelRate=title5.text();
		
		model.addAttribute("hotelTitle",hotelTitle);
		model.addAttribute("hotelAdd",hotelAdd);
		model.addAttribute("hotelRate",hotelRate);
		
		//map 정보
		Elements ele2 = ele1.select("div.tab");
		Elements ele3 = ele2.select("button[onclick]");
		String mapData=ele3.attr("onclick");
		mapData=mapData.substring(8);
		mapData=mapData.replace("'", "");
		mapData=mapData.replace("(", "");
		mapData=mapData.replace(")", "");
		mapData=mapData.replace(";", "");
		String[] mapDataList=mapData.split(",");
		String mapy=mapDataList[0];
		String mapx=mapDataList[1].trim();
		
		model.addAttribute("mapy",mapy);
		model.addAttribute("mapx",mapx);
		
		//세부사항 정보
		ArrayList<String> info1List = new ArrayList<String>();
		ArrayList<String> info2List = new ArrayList<String>();
		
		Elements info1 = ele1.select("section.default_info");
		Elements info2 = info1.select("h3");
		Elements info3 = info1.select("ul");
		
		for(Element el:info2) {
			info1List.add(el.text());
		}
		
		for(Element el:info3) {
			info2List.add(el.text());
		}
		
//		for(int i=0; i<info1List.size(); i++) {
//			System.out.println(info1List.get(i));
//		}
//		
//		for(int i=0; i<info2List.size(); i++) {
//			System.out.println(info2List.get(i));
//		}
		model.addAttribute("info1List",info1List);
		model.addAttribute("info2List",info2List);
		//세부정보 끝
		
		//방 가격
		ArrayList<String> roomList = new ArrayList<String>();
		ArrayList<String> priceList = new ArrayList<String>();
		ArrayList<String> roomImgs = new ArrayList<String>();
		
		Elements room1 = ele1.select("article.room_info");
		Elements room2 = room1.select("strong.title");
		for(Element el:room2) {
			roomList.add(el.text());
		}

		model.addAttribute("roomTitle",roomList);
		
		Elements roomPrice1 = ele1.select("div.price");
		Elements roomPrice2 = roomPrice1.select("p");
		int i=0;
		for(Element el:roomPrice2) {
			if(el.text().isEmpty()) {
				continue;
			}
			//판매완료
			if(el.text().equals("다른날짜 확인")) {
				priceList.add("판매완료");
//				System.out.println("판매완료: "+el.text());
			}else {
				if(roomPrice1.select("b").size()==i) {
					break;
				}
				String result = roomPrice1.select("b").get(i).text();
				priceList.add(result);
//				System.out.println(i+"판매가능: "+result);
				i++;
			}
		}
		
		
		model.addAttribute("roomPrice",priceList);
		
		Elements roomimg1 = ele1.select("p.pic_view");
		Elements roomimg2 = roomimg1.select("img");
		
		for(Element el:roomimg2) {
			roomImgs.add(el.attr("abs:data-original"));
		}
		
		model.addAttribute("roomImgs",roomImgs);
		
		//방 가격 끝
		
		
		
		return "booking/hotelDetail";
	}
	
	////////////////////
	
	////////ajax통신 연습//////////
	
	@RequestMapping(value = "searchCode", produces = "application/json; charset=utf-8")
	public void searchList(HttpServletRequest req, HttpServletResponse res, String param) {
//		System.out.println("여기 오긴 함?");
//		System.out.println(param);
		
		res.setCharacterEncoding("utf-8");
		try {
			String province = param;
			List<String> cityList = new ArrayList<String>();
			
			if(province.equals("seoul")) {
				cityList.add("서울전체");
				cityList.add("강남ㆍ역삼ㆍ삼성ㆍ신사ㆍ청담");
				cityList.add("서초ㆍ교대");
				cityList.add("잠실ㆍ송파ㆍ왕십리ㆍ강동");
				cityList.add("을지로ㆍ시청ㆍ명동");
				cityList.add("종로ㆍ인사동ㆍ동대문ㆍ강북");
				cityList.add("서울역ㆍ이태원ㆍ용산");
				cityList.add("마포ㆍ홍대ㆍ신총ㆍ서대문");
				cityList.add("영등포ㆍ여의도ㆍ김포공항");
				cityList.add("구로ㆍ금천ㆍ관악ㆍ동작");
			}
			else if(province.equals("busan")) {
				cityList.add("부산전체");
				cityList.add("해운대");
				cityList.add("광안리ㆍ기장");
				cityList.add("부산역ㆍ남포ㆍ자갈치ㆍ영도");
				cityList.add("서면ㆍ동래ㆍ연제ㆍ남구");
				cityList.add("김해공항ㆍ기타");
			}
			else if(province.equals("jeju")) {
				cityList.add("제주전체");
				cityList.add("제주공항ㆍ애월ㆍ함덕");
				cityList.add("서귀포시ㆍ중문ㆍ표선ㆍ성산");
			}
			else if(province.equals("gangwon")) {
				cityList.add("강원전체");
				cityList.add("강릉ㆍ속초");
				cityList.add("양양ㆍ동해ㆍ고성ㆍ삼척");
				cityList.add("춘천ㆍ홍천ㆍ인제ㆍ철원");
				cityList.add("평창ㆍ정선ㆍ횡성");
				cityList.add("영월ㆍ원주ㆍ태백");
			}
			else if(province.equals("geunggi")) {
				cityList.add("경기전체");
				cityList.add("수원ㆍ성남");
				cityList.add("용인ㆍ평택");
				cityList.add("화성ㆍ안산ㆍ부천ㆍ안양");
				cityList.add("고양ㆍ의정부ㆍ파주ㆍ김포");
				cityList.add("시흥ㆍ군포ㆍ광명");
				cityList.add("남양주시ㆍ구리ㆍ하남");
				cityList.add("가평ㆍ양평");
			}
			else if(province.equals("incheon")) {
				cityList.add("인천전체");
				cityList.add("송도ㆍ남동구ㆍ옹진군");
				cityList.add("인천국제공항(중구)");
				cityList.add("부평ㆍ계양ㆍ서구ㆍ미추홀구ㆍ강화");
			}
			else if(province.equals("geungsang")) {
				cityList.add("경상전체");
				cityList.add("경주ㆍ포항ㆍ울진ㆍ영덕");
				cityList.add("거제ㆍ통영");
				cityList.add("대구ㆍ구미ㆍ문경ㆍ안동");
				cityList.add("울산ㆍ양산");
				cityList.add("창원ㆍ김해");
				cityList.add("사천ㆍ남해ㆍ진주ㆍ함양");
			}
			else if(province.equals("junla")) {
				cityList.add("전라전체");
				cityList.add("여수");
				cityList.add("전주");
				cityList.add("광주");
				cityList.add("광양ㆍ구례ㆍ순천ㆍ화순ㆍ남원");
				cityList.add("군산ㆍ익산ㆍ부안ㆍ진안ㆍ무주");
				cityList.add("목포ㆍ나주ㆍ완도ㆍ해남ㆍ영암");
			}
			else if(province.equals("chungcheng")) {
				cityList.add("충청전체");
				cityList.add("대전");
				cityList.add("천안ㆍ아산ㆍ예산ㆍ당진");
				cityList.add("보령ㆍ서산ㆍ태안");
				cityList.add("청주ㆍ제천ㆍ충주ㆍ보은ㆍ금산");
			}
			
			JSONArray jsonArray = new JSONArray();
			
			for(int i=0; i<cityList.size(); i++) {
				jsonArray.put(cityList.get(i).toString());
//				System.out.println(jsonArray.get(i));
			}
			
			
			PrintWriter pw = res.getWriter();
			pw.print(jsonArray.toString());
			pw.flush();
			pw.close();
			
//			for(int i=0; i<jsonArray.length(); i++) {
//				System.out.println(jsonArray.get(i));
//			}
			
		} catch(Exception e) {
			System.out.println("ajax error");
		}
	}
	
	//////////////////////////////
	
	
}