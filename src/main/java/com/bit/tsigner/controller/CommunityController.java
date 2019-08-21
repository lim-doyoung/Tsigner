package com.bit.tsigner.controller;


import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	public String communityBbsAdd(@ModelAttribute CommunityVo bean) throws SQLException {
		communityService.add(bean);
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
	
//	@GetMapping("/community_bbs/detail/{idx}")
//	public ModelAndView detail(@PathVariable("idx") int cmnt_seq) throws SQLException {
//		System.out.println(cmnt_seq);
////		communityService.detailCnt(cmnt_seq);
//		ModelAndView mav=new ModelAndView();
//		mav.addObject("detail",communityService.detail(cmnt_seq));
//		mav.setViewName("community/bbs");
//		return mav;
//	}
	
	@PutMapping("/json/obj")
	public void update(@ModelAttribute CommunityVo bean) {
		
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
