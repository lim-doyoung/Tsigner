package com.bit.tsigner.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "/community_bbs/add",method = RequestMethod.POST)
	public String communityBbsAdd(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME) throws SQLException {
		String uploadDir2="C:\\java\\upload\\";
		
		long time=System.currentTimeMillis();
		String origin=CMNT_FILENAME.getOriginalFilename();
		String newName=time+origin;
		System.out.println(newName);
		bean.setCmnt_filename(newName);
		bean.setCmnt_file_path2(uploadDir2);
		communityService.add(bean);
		File file=new File(uploadDir2+newName);

		try {
			CMNT_FILENAME.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(bean.toString());
		return "redirect:/community_bbs";
	}
	
	@RequestMapping(value = "/community_bbs/update",method = RequestMethod.POST)
	public String communityBbsUpdate(@ModelAttribute CommunityVo bean) throws SQLException {
		communityService.update(bean);
		System.out.println(bean);
		return "redirect:/community_bbs";
	}
	
	@RequestMapping(value = "/community_bbs/delete/{idx}",method = RequestMethod.GET)
	public String communityBbsDelete(@PathVariable("idx") int cmnt_seq) throws SQLException {
		System.out.println(cmnt_seq);
		
		//System.out.println(req.getParameter("keyVal"));
		communityService.delete(cmnt_seq);
		return "redirect:/community_bbs";
	}
	
	@RequestMapping(value = "/community_bbs/download/{cmnt_filtname:.+}",method = RequestMethod.GET)
	public String communityBbsDownload(HttpServletResponse resp,@PathVariable String cmnt_filtname) throws SQLException {
		System.out.println("addr µÇ³ª?"+cmnt_filtname);
		String uploadDir2="upload/";
		
		resp.setContentType("application/octet-stream;charset=\"utf-8\"");
		
		File file=new File(uploadDir2+cmnt_filtname);
		OutputStream os=null;
		InputStream is=null;
		
		try {
			os=resp.getOutputStream();
			is=new FileInputStream(file);
			int temp=0;
			while((temp=is.read())!=-1) {
				os.write(temp);
			}
//			os.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
//		finally {
//			try {
//				if(os!=null)os.close();
//				if(is!=null)is.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		return uploadDir2;
	}
	
	@GetMapping("/json/obj")
	public ResponseEntity detail(@RequestParam("idx") int cmnt_seq) throws SQLException {
		ResponseEntity entity=null;
		if(cmnt_seq>0) {
			entity=ResponseEntity
					.status(HttpStatus.OK)
					.body(communityService.detail(cmnt_seq));
		}else {
			entity=ResponseEntity
					.status(HttpStatus.BAD_REQUEST)
					.body(communityService.detail(cmnt_seq));
		}
		communityService.detailCnt(cmnt_seq);
		return entity;	
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
