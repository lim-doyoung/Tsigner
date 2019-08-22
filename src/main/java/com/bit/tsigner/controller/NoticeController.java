package com.bit.tsigner.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.service.NoticeService;

@Controller
public class NoticeController {
	
	@Inject
	NoticeService noticeService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "/notice" )
	public String notice(Model model) throws SQLException {
		
		logger.debug("공지사항");

		noticeService.getList(model);
		
		return "notice/notice";
	}
	
	@RequestMapping(value="/notice/add", method=RequestMethod.POST)
	public String add(@ModelAttribute NoticeVo bean) throws SQLException{
		noticeService.add(bean);
		return "redirect:/notice";
	}
	
	
	@RequestMapping(value="/notice/detail")
	public String detail(Model model,@RequestParam("idx") int idx) throws SQLException{
		
		noticeService.detail(model,idx);
		
		return "notice/noticeDetail";
	}



}
