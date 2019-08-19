package com.bit.tsigner.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping(value = "/community")
	public String community() {
		
		return "community/community";
	}
	
	@GetMapping(value = "/community_planner")
	public String communityPlanner() {
		
		return "community/planner";
	}
	
	@GetMapping(value = "/community_bbs")
	public String communityBbs() {
		
		return "community/bbs";
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
