package com.bit.tsigner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PlanerController {
	
	@GetMapping(value = "/planer")
	public String planer() {
		
		return "planer";
	}
}
