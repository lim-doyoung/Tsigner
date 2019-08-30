package com.bit.tsigner.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.tsigner.model.entity.PlannerVo;
import com.bit.tsigner.service.PlannerService;

@Controller
public class PlannerController {
	
	@Inject
	PlannerService plannerService;
	
	//플래너 메인
	@GetMapping(value = "/planner")
	public String planner() {
		
		return "planner/planner";
	}
	
	//플래너 만들기
	@GetMapping(value = "/makeplan")
	public String makeplan() {
		
		return "planner/makeplan";
	}
	
	//플래너 검색
	@RequestMapping(value = "/searchMap", method = RequestMethod.POST)
	public String searchMap() {
		
		System.out.println("검색");
		
		
		return "planner/makeplan";
	}
	
	//플래너 시,군,구 코드 세팅
		@GetMapping("/search/areacode")
		public @ResponseBody List<PlannerVo> searchCode(@RequestParam("areaCode") String areaCode) throws SQLException {
			System.out.println("areaCode : "+areaCode);
				
			return plannerService.searchCode(areaCode);
		}
		
		//데이터 저장
		@ResponseBody
		@PostMapping("/save")
		public String saveData(@RequestBody String sJson) throws SQLException {
			
			JSONParser jsonParse=new JSONParser();
			List<Map<String,Object>> mgtList=new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> mstList=new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> dtlList=new ArrayList<Map<String,Object>>();
			try {
				JSONObject jsonObj=(JSONObject)jsonParse.parse(sJson);
				
				JSONArray mgtArray = (JSONArray) jsonObj.get("planMgt");
				JSONArray mstArray=(JSONArray)jsonObj.get("planMst");
				JSONArray dtlArray=(JSONArray)jsonObj.get("planDtl");
				
				//planMgt
				for(int i=0; i < ((JSONArray) mgtArray).size(); i++) {
					Map<String, Object> mgtMap=new HashMap<String, Object>();
					System.out.println("==============================");
					JSONObject mgtObject = (JSONObject) mgtArray.get(i);
					
					mgtMap.put("plan_code", mgtObject.get("plan_code"));
					mgtMap.put("user_id", mgtObject.get("user_id"));
					mgtMap.put("tot_amt", mgtObject.get("tot_amt"));
					mgtMap.put("trv_from_date", mgtObject.get("trv_from_date"));
					mgtMap.put("trv_to_date", mgtObject.get("trv_to_date"));
					mgtMap.put("tot_dist", mgtObject.get("tot_dist"));
					
					mgtList.add(mgtMap);
					
					System.out.println(mgtObject.get("plan_code"));
					System.out.println(mgtObject.get("user_id"));
					System.out.println(mgtObject.get("tot_amt"));
					System.out.println(mgtObject.get("trv_from_date"));
					System.out.println(mgtObject.get("trv_to_date"));
					System.out.println(mgtObject.get("tot_dist"));
					System.out.println("==============================");
				}
				
				//planMst
				for(int i=0; i < ((JSONArray) mstArray).size(); i++) {
					Map<String, Object> mstMap=new HashMap<String, Object>();
					System.out.println("==============================");
					JSONObject mstObject = (JSONObject) mstArray.get(i);
					
					mstMap.put("plan_code", mstObject.get("plan_code"));
					mstMap.put("trv_deg", mstObject.get("trv_deg"));
					mstMap.put("trv_date", mstObject.get("trv_date"));
					mstMap.put("day_dist", mstObject.get("day_dist"));
					mstMap.put("day_amt", mstObject.get("day_amt"));
					mstMap.put("day_room_chg", mstObject.get("day_room_chg"));
					mstMap.put("day_food_exp", mstObject.get("day_food_exp"));
					mstMap.put("day_tran_exp", mstObject.get("day_tran_exp"));
					
					mstList.add(mstMap);
					
					System.out.println(mstObject.get("plan_code"));
					System.out.println(mstObject.get("trv_deg"));
					System.out.println(mstObject.get("trv_date"));
					System.out.println(mstObject.get("day_dist"));
					System.out.println(mstObject.get("day_amt"));
					System.out.println(mstObject.get("day_room_chg"));
					System.out.println(mstObject.get("day_food_exp"));
					System.out.println(mstObject.get("day_tran_exp"));
					System.out.println("==============================");
				}
				
				//planDtl
				for(int i=0; i < ((JSONArray) dtlArray).size(); i++) {
					Map<String, Object> dtlMap=new HashMap<String, Object>();
					System.out.println("==============================");
					JSONObject dtlObject = (JSONObject) dtlArray.get(i);
					
					String loc_post_code="";
					if("undefined".equals((String)dtlObject.get("loc_post_code"))) {
						loc_post_code="";
					}else {
						loc_post_code=(String) dtlObject.get("loc_post_code");
					}
					
					String loc_img_url="";
					if("undefined".equals((String)dtlObject.get("loc_img_url"))) {
						loc_img_url="";
					}else {
						loc_img_url=(String) dtlObject.get("loc_img_url");
					}
					
					String loc_tel="";
					if("undefined".equals((String)dtlObject.get("loc_tel"))) {
						loc_tel="";
					}else {
						loc_tel=(String) dtlObject.get("loc_tel");
					}
					
					dtlMap.put("loc_name", dtlObject.get("loc_name"));
					dtlMap.put("loc_addr", dtlObject.get("loc_addr"));
					dtlMap.put("loc_type", dtlObject.get("loc_type"));
					dtlMap.put("trv_deg", dtlObject.get("trv_deg"));
					dtlMap.put("loc_post_code", loc_post_code);
					dtlMap.put("position_x", dtlObject.get("position_x"));
					dtlMap.put("position_y", dtlObject.get("position_y"));
					dtlMap.put("loc_img_url", loc_img_url);
					dtlMap.put("content_id", dtlObject.get("content_id"));
					dtlMap.put("loc_tel", loc_tel);
					dtlMap.put("overview", dtlObject.get("overview"));
					dtlMap.put("loc_seq", dtlObject.get("loc_seq"));
					
					dtlList.add(dtlMap);
					
					System.out.println(dtlObject.get("loc_name"));
					System.out.println(dtlObject.get("loc_addr"));
					System.out.println(dtlObject.get("loc_type"));
					System.out.println(dtlObject.get("trv_deg"));
					System.out.println(dtlObject.get("loc_post_code"));
					System.out.println(dtlObject.get("position_x"));
					System.out.println(dtlObject.get("position_y"));
					System.out.println(dtlObject.get("loc_img_url"));
					System.out.println(dtlObject.get("content_id"));
					System.out.println(dtlObject.get("loc_tel"));
					System.out.println(dtlObject.get("overview"));
					System.out.println(dtlObject.get("loc_seq"));
					System.out.println("==============================");
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String planCode=plannerService.saveData(mgtList,mstList,dtlList);
			
			//리턴 할 json객체 생성
			JSONObject planObject = new JSONObject();
			JSONArray planArray = new JSONArray();
			JSONObject planInfo = new JSONObject();
			planInfo.put("planCode", planCode);
			planArray.add(planInfo);
			planObject.put("planCode", planArray);
			
			String jsonResult = planObject.toJSONString();
			
			return jsonResult;
		}
		
		
	
}
