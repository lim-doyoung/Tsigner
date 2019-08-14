package com.bit.tsigner.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping(value = "/community")
	public String community() {
		
		return "community/community";
	}
}
