package com.bit.tsigner.controller;


import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.service.CommunityService;

@Controller
public class CommunityController {
	@Inject
	CommunityService communityService;
	
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String community() throws SQLException {
		return "community/community";
	}
	
	@GetMapping(value = "/community_planner")
	public String communityPlanner() {
		
		return "community/planner";
	}
	
	@RequestMapping(value = "/community_bbs")
	public String communityBbs(Model model) throws SQLException {
		communityService.list(model);
		return "community/bbs";
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String communityBbsAdd(@ModelAttribute CommunityVo bean) throws SQLException {
		System.out.println(1);
		communityService.add(bean);
		return "redirect:/";
	}
	
	@GetMapping(value = "/community_question")
	public String communityquestion() {
		
		return "community/question";
	}
	@GetMapping(value = "/community_together")
	public String communityTogether() {
		
		return "community/together";
	}
}
