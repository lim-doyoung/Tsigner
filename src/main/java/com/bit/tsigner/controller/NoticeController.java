package com.bit.tsigner.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.inject.Inject;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bit.tsigner.service.CommunityService;

@Controller
public class NoticeController {
	
	@GetMapping(value = "/notice")
	public String notice(Model model) throws IOException {

		return "notice/notice";
	}



}
