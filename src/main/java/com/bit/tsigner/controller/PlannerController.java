package com.bit.tsigner.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
}
