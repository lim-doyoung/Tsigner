package com.bit.tsigner.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.service.NoticeService;

@Controller
public class NoticeController {
	
	@Inject
	NoticeService noticeService;
	
	String uploadDir="C:\\java\\workspace5\\tsigner\\src\\main\\webapp\\upload\\";	//upload 파일 저장되는 주소
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "/notice" )
	public String notice(Model model) throws SQLException {
		
		logger.debug("공지사항");

		noticeService.getList(model);
		
		return "notice/notice";
	}
	
	@RequestMapping(value="/notice/add", method=RequestMethod.POST)
	public String add(@ModelAttribute NoticeVo bean) throws SQLException{
		
		System.out.println(bean.getNoti_title());
		System.out.println(bean.getNoti_content());
		System.out.println(bean.getUpload_files());
		
		
		String newName=null;
		
		for(MultipartFile file1 : bean.getUpload_files()) {
			if(file1 == null || file1.isEmpty())continue;
			logger.debug(file1.getOriginalFilename());
			
			long time= System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName=time+origin;	//파일명 중복 막기 위해 파일명 = 이름+시간
			
			bean.setNoti_file_path1(newName);	//파일패스1에 파일명 넣어주기
			
			System.out.println("newName"+bean.getNoti_file_path1());
			File file= new File(uploadDir+newName);
			
			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		//noticeService.upload(newName);
		noticeService.add(bean);
		return "redirect:/notice";
	}
	
	//게시글 상세보기
	@RequestMapping(value="/notice/detail")
	public String detail(Model model,@RequestParam("idx") int idx) throws SQLException{
		
		noticeService.detail(model,idx);
		noticeService.viewcnt(idx);
		
		//System.out.println("조회수 "+noti_hits);
		//logger.debug("조회수 "+noti_hits);
		
		return "notice/noticeDetail";
	}
	
	
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String update(@ModelAttribute NoticeVo bean, @RequestParam("idx") int idx, @RequestParam("sub") String sub, @RequestParam("content") String content) throws SQLException{
		noticeService.update(idx, sub, content);
		
		return "redirect:/notice";
	}
	
	
	@RequestMapping(value="/notice/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("idx") int idx) throws SQLException{
		noticeService.delete(idx);
		return "redirect:/notice";
	}
	
//	@RequestMapping(value="/notice/upload", method=RequestMethod.POST)
//	public String upload(Model model, @ModelAttribute NoticeVo bean) throws SQLException{	//파일 여러개 받을라면 Vo 써야함
//		String newName=null;
//		
//		for(MultipartFile file1 : bean.getUpload_files()) {
//			if(file1 == null || file1.isEmpty())continue;
//			logger.debug(file1.getOriginalFilename());
//			
//			long time= System.currentTimeMillis();
//			String origin = file1.getOriginalFilename();
//			newName=time+origin;	//파일명 중복 막기 위해 파일명 = 이름+시간
//			
//			
//			
//			
//			File file= new File(uploadDir+newName);
//			
//			try {
//				file1.transferTo(file);
//			} catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//		}
//		
//		
//		noticeService.upload(newName);
//		
//		return "notice/noticeDetail";
//	}



}
