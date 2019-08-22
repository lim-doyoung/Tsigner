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
		logger.debug("��ŷ������");
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
		
		String[] search =sigun.split("��");
		if(search[0].isEmpty()) {
			search[0]="����";
			search[1]="��ü";
		}
		int si=1;
		int gun=1;
		if(search[0].equals("����")) {
			si=1;
		}else if(search[0].equals("�λ�")) {
			si=6;
		}else if(search[0].equals("����")) {
			si=39;
		}
		else if(search[0].equals("��õ")) {
			si=2;
		}
		else if(search[0].equals("����")) {
			si=3;
		}
		else if(search[0].equals("�뱸")) {
			si=4;
		}
		else if(search[0].equals("����")) {
			si=5;
		}
		else if(search[0].equals("���")) {
			si=7;
		}
		else if(search[0].equals("����Ư��")) {
			si=8;
		}
		else if(search[0].equals("��⵵")) {
			si=31;
		}
		else if(search[0].equals("������")) {
			si=32;
		}
		else if(search[0].equals("��û�ϵ�")) {
			si=33;
		}
		else if(search[0].equals("��û����")) {
			si=34;
		}
		else if(search[0].equals("���ϵ�")) {
			si=35;
		}
		else if(search[0].equals("��󳲵�")) {
			si=36;
		}
		else if(search[0].equals("����ϵ�")) {
			si=37;
		}
		else if(search[0].equals("���󳲵�")) {
			si=38;
		}
		
//		if(search[1].equals("����")) {
//			gun=1;
//		}else if(search[1].equals("����")) {
//			gun=23;
//		}else if(search[1].equals("�߱�")) {
//			gun=24;
//		}else if(search[1].equals("�ؿ��")) {
//			gun=16;
//		}else if(search[1].equals("�λ��߱�")) {
//			gun=15;
//		}else if(search[1].equals("�λ�����")) {
//			gun=7;
//		}else if(search[1].equals("������")) {
//			gun=3;
//		}else if(search[1].equals("����")) {
//			gun=4;
		if(search[1].equals("��ü")){
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
		String[] search =sigun.split("��");
		int si=1;
		int gun=1;
		
		if(search[0].equals("����")) {
			si=1;
		}else if(search[0].equals("�λ�")) {
			si=6;
		}else if(search[0].equals("����")) {
			si=39;
		}
		else if(search[0].equals("��õ")) {
			si=2;
		}
		else if(search[0].equals("����")) {
			si=3;
		}
		else if(search[0].equals("�뱸")) {
			si=4;
		}
		else if(search[0].equals("����")) {
			si=5;
		}
		else if(search[0].equals("���")) {
			si=7;
		}
		else if(search[0].equals("����Ư��")) {
			si=8;
		}
		else if(search[0].equals("��⵵")) {
			si=31;
		}
		else if(search[0].equals("������")) {
			si=32;
		}
		else if(search[0].equals("��û�ϵ�")) {
			si=33;
		}
		else if(search[0].equals("��û����")) {
			si=34;
		}
		else if(search[0].equals("���ϵ�")) {
			si=35;
		}
		else if(search[0].equals("��󳲵�")) {
			si=36;
		}
		else if(search[0].equals("����ϵ�")) {
			si=37;
		}
		else if(search[0].equals("���󳲵�")) {
			si=38;
		}
		
//		if(search[1].equals("����")) {
//			gun=1;
//		}else if(search[1].equals("����")) {
//			gun=23;
//		}else if(search[1].equals("�߱�")) {
//			gun=24;
//		}else if(search[1].equals("�ؿ��")) {
//			gun=16;
//		}else if(search[1].equals("�λ��߱�")) {
//			gun=15;
//		}else if(search[1].equals("�λ�����")) {
//			gun=7;
//		}else if(search[1].equals("������")) {
//			gun=3;
//		}else if(search[1].equals("����")) {
//			gun=4;
		if(search[1].equals("��ü")){
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
	//ũ�Ѹ� ����

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
			price=price.replace("���� ���� 1��", "");
			price=price.replace("���� ���� 2��", "");
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
		
	
		
		//detail�� �ʿ��� ���� �Ľ��ؿ���
		////���⼭����
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
		
		////�������
		
		model.addAttribute("priceList",priceList);
		model.addAttribute("titleList",titleList);
		model.addAttribute("imgs",imgs);
		
		
		
		return "booking/hotel";
	}
	
	@GetMapping(value = "searchRoom")
	public String roomSearch(Model model, @RequestParam("region") String region,@RequestParam("checkIn") String checkIn,@RequestParam("checkOut") String checkOut,@RequestParam("persons") String persons) throws IOException {
		if(region.equals("������ü")) {
			region="2/2003";
		}else if(region.equals("������������Ｚ���Ż��û��")) {
			region="2/2012";
		}
		else if(region.equals("���ʤ�����")) {
			region="2/2019";
		}
		else if(region.equals("��Ǥ����Ĥ��սʸ�������")) {
			region="2/2016";
		}
		else if(region.equals("�����Τ���û����")) {
			region="2/2014";
		}
		else if(region.equals("���Τ��λ絿�����빮������")) {
			region="2/2015";
		}
		else if(region.equals("���￪�����¿������")) {
			region="2/2020";
		}
		else if(region.equals("������ȫ������Ѥ����빮")) {
			region="2/2018";
		}
		else if(region.equals("�����������ǵ�����������")) {
			region="2/2017";
		}
		else if(region.equals("���Τ���õ�����Ǥ�����")) {
			region="2/2021";
		}
		else if(region.equals("�λ���ü")) {
			region="2/2004";
		}
		else if(region.equals("�ؿ��")) {
			region="2/2041";
		}
		else if(region.equals("���ȸ�������")) {
			region="2/2043";
		}
		else if(region.equals("�λ꿪���������ڰ�ġ������")) {
			region="2/2042";
		}
		else if(region.equals("���������������������")) {
			region="2/2044";
		}
		else if(region.equals("���ذ��פ���Ÿ")) {
			region="2/2045";
		}
		else if(region.equals("������ü")) {
			region="2/2005";
		}
		else if(region.equals("���ְ��פ��ֿ����Դ�")) {
			region="2/2051";
		}
		else if(region.equals("�������ä��߹���ǥ��������")) {
			region="2/2052";
		}
		else if(region.equals("������ü")) {
			region="2/2008";
		}
		else if(region.equals("����������")) {
			region="2/2081";
		}
		else if(region.equals("�������ؤ�������ô")) {
			region="2/2084";
		}
		else if(region.equals("��õ��ȫõ��������ö��")) {
			region="2/2082";
		}
		else if(region.equals("��â��������Ⱦ��")) {
			region="2/2083";
		}
		else if(region.equals("���������֤��¹�")) {
			region="2/2085";
		}
		else if(region.equals("�����ü")) {
			region="2/2006";
		}
		else if(region.equals("����������")) {
			region="2/2061";
		}
		else if(region.equals("���Τ�����")) {
			region="2/2064";
		}
		else if(region.equals("ȭ�����Ȼ����õ���Ⱦ�")) {
			region="2/2065";
		}
		else if(region.equals("���������Τ����֤�����")) {
			region="2/2063";
		}
		else if(region.equals("���������������")) {
			region="2/2066";
		}
		else if(region.equals("�����ֽä��������ϳ�")) {
			region="2/2067";
		}
		else if(region.equals("���������")) {
			region="2/2062";
		}
		else if(region.equals("��õ��ü")) {
			region="2/2007";
		}
		else if(region.equals("�۵�����������������")) {
			region="2/2071";
		}
		else if(region.equals("��õ��������(�߱�)")) {
			region="2/2072";
		}
		else if(region.equals("�������������������Ȧ������ȭ")) {
			region="2/2070";
		}
		else if(region.equals("�����ü")) {
			region="2/2010";
		}
		else if(region.equals("���֤����פ�����������")) {
			region="2/2101";
		}
		else if(region.equals("�������뿵")) {
			region="2/2103";
		}
		else if(region.equals("�뱸�����̤�������ȵ�")) {
			region="2/2102";
		}
		else if(region.equals("�������")) {
			region="2/2104";
		}
		else if(region.equals("â��������")) {
			region="2/2105";
		}
		else if(region.equals("��õ�����ؤ����֤��Ծ�")) {
			region="2/2106";
		}
		else if(region.equals("������ü")) {
			region="2/2011";
		}
		else if(region.equals("����")) {
			region="2/2112";
		}
		else if(region.equals("����")) {
			region="2/2110";
		}
		else if(region.equals("����")) {
			region="2/2111";
		}
		else if(region.equals("��������ʤ���õ��ȭ��������")) {
			region="2/2113";
		}
		else if(region.equals("������ͻ���ξȤ����Ȥ�����")) {
			region="2/2114";
		}
		else if(region.equals("���������֤��ϵ����س�������")) {
			region="2/2115";
		}
		else if(region.equals("��û��ü")) {
			region="2/2009";
		}
		else if(region.equals("����")) {
			region="2/2093";
		}
		else if(region.equals("õ�Ȥ��ƻ�����������")) {
			region="2/2095";
		}
		else if(region.equals("���ɤ�������¾�")) {
			region="2/2096";
		}
		else if(region.equals("û�֤���õ�����֤��������ݻ�")) {
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
			price=price.replace("���� ���� 1��", "");
			price=price.replace("���� ���� 2��", "");
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
		
	
		
		//detail�� �ʿ��� ���� �Ľ��ؿ���
		////���⼭����
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
		
		////�������
		
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
		//�̹��� ����Ʈ
		ArrayList<String> thumbList = new ArrayList<String>();
		Elements thumb1 = doc.select("div.gallery_pc");
		Elements thumb2 = thumb1.select("div.gallery-top");
		Elements thumb3 = thumb2.select("img");
		for(Element el: thumb3) {
			thumbList.add(el.attr("data-src"));
		}
		model.addAttribute("thumbList",thumbList);
		
		//����
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
		
		//map ����
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
		
		//���λ��� ����
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
		//�������� ��
		
		//�� ����
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
			//�ǸſϷ�
			if(el.text().equals("�ٸ���¥ Ȯ��")) {
				priceList.add("�ǸſϷ�");
//				System.out.println("�ǸſϷ�: "+el.text());
			}else {
				if(roomPrice1.select("b").size()==i) {
					break;
				}
				String result = roomPrice1.select("b").get(i).text();
				priceList.add(result);
//				System.out.println(i+"�ǸŰ���: "+result);
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
		
		//�� ���� ��
		
		
		
		return "booking/hotelDetail";
	}
	
	////////////////////
	
	////////ajax��� ����//////////
	
	@RequestMapping(value = "searchCode", produces = "application/json; charset=utf-8")
	public void searchList(HttpServletRequest req, HttpServletResponse res, String param) {
//		System.out.println("���� ���� ��?");
//		System.out.println(param);
		
		res.setCharacterEncoding("utf-8");
		try {
			String province = param;
			List<String> cityList = new ArrayList<String>();
			
			if(province.equals("seoul")) {
				cityList.add("������ü");
				cityList.add("������������Ｚ���Ż��û��");
				cityList.add("���ʤ�����");
				cityList.add("��Ǥ����Ĥ��սʸ�������");
				cityList.add("�����Τ���û����");
				cityList.add("���Τ��λ絿�����빮������");
				cityList.add("���￪�����¿������");
				cityList.add("������ȫ������Ѥ����빮");
				cityList.add("�����������ǵ�����������");
				cityList.add("���Τ���õ�����Ǥ�����");
			}
			else if(province.equals("busan")) {
				cityList.add("�λ���ü");
				cityList.add("�ؿ��");
				cityList.add("���ȸ�������");
				cityList.add("�λ꿪���������ڰ�ġ������");
				cityList.add("���������������������");
				cityList.add("���ذ��פ���Ÿ");
			}
			else if(province.equals("jeju")) {
				cityList.add("������ü");
				cityList.add("���ְ��פ��ֿ����Դ�");
				cityList.add("�������ä��߹���ǥ��������");
			}
			else if(province.equals("gangwon")) {
				cityList.add("������ü");
				cityList.add("����������");
				cityList.add("�������ؤ�������ô");
				cityList.add("��õ��ȫõ��������ö��");
				cityList.add("��â��������Ⱦ��");
				cityList.add("���������֤��¹�");
			}
			else if(province.equals("geunggi")) {
				cityList.add("�����ü");
				cityList.add("����������");
				cityList.add("���Τ�����");
				cityList.add("ȭ�����Ȼ����õ���Ⱦ�");
				cityList.add("���������Τ����֤�����");
				cityList.add("���������������");
				cityList.add("�����ֽä��������ϳ�");
				cityList.add("���������");
			}
			else if(province.equals("incheon")) {
				cityList.add("��õ��ü");
				cityList.add("�۵�����������������");
				cityList.add("��õ��������(�߱�)");
				cityList.add("�������������������Ȧ������ȭ");
			}
			else if(province.equals("geungsang")) {
				cityList.add("�����ü");
				cityList.add("���֤����פ�����������");
				cityList.add("�������뿵");
				cityList.add("�뱸�����̤�������ȵ�");
				cityList.add("�������");
				cityList.add("â��������");
				cityList.add("��õ�����ؤ����֤��Ծ�");
			}
			else if(province.equals("junla")) {
				cityList.add("������ü");
				cityList.add("����");
				cityList.add("����");
				cityList.add("����");
				cityList.add("��������ʤ���õ��ȭ��������");
				cityList.add("������ͻ���ξȤ����Ȥ�����");
				cityList.add("���������֤��ϵ����س�������");
			}
			else if(province.equals("chungcheng")) {
				cityList.add("��û��ü");
				cityList.add("����");
				cityList.add("õ�Ȥ��ƻ�����������");
				cityList.add("���ɤ�������¾�");
				cityList.add("û�֤���õ�����֤��������ݻ�");
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