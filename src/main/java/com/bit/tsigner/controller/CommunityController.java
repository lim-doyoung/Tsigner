package com.bit.tsigner.controller;


import java.io.File;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;
import com.bit.tsigner.model.entity.PagingTest;
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

//커뮤니티 자유게시판 컨트롤러	
	@RequestMapping(value = "/community_bbs")
	public String communityBbs(Model model,HttpServletRequest res) throws SQLException {
		//아래는 데이터베이스에서 처리할때 필요함
//		int page=1;
//		if(res.getParameter("idx")==null) {
//			System.out.println("pagenum is null");
//		}else {
//			page=Integer.parseInt((res.getParameter("idx")));
//		}
//		Criteria cr=new Criteria();
//		cr.setPage(page);
//		System.out.println("page:"+page);
//		model.addAttribute(cr);
		communityService.list(model);
		System.out.println("BbsController:"+model);
		return "community/bbs";
	}
//자유게시판 리스트
	@GetMapping("/json/list")
	public @ResponseBody List getList() throws SQLException {
		return communityService.list();
	}
	
//자유게시판 입력
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
//자유게시판 수정
	@RequestMapping(value = "/community_bbs/update",method = RequestMethod.POST)
	public String communityBbsUpdate(@ModelAttribute CommunityVo bean) throws SQLException {
		communityService.update(bean);
		System.out.println(bean);
		return "redirect:/community_bbs";
	}
//자유게시판 삭제
	@RequestMapping(value = "/community_bbs/delete/{idx}",method = RequestMethod.GET)
	public String communityBbsDelete(@PathVariable("idx") int cmnt_seq) throws SQLException {
		System.out.println(cmnt_seq);
		communityService.delete(cmnt_seq);
		return "redirect:/community_bbs";
	}
//자유게시판 다운로드 (안됨)
	@RequestMapping(value = "/community_bbs/download/{cmnt_filtname:.+}",method = RequestMethod.GET)
	public String communityBbsDownload(HttpServletResponse resp,@PathVariable String cmnt_filtname) throws SQLException {
		System.out.println("addr 되나?"+cmnt_filtname);
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
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return uploadDir2;
	}
//자유게시판 상세
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
//컴뮤니티 투게더	
	@GetMapping(value = "/community_together")
	public String communityTogether(Model model) throws SQLException {
		communityService.TogetherList(model);
		System.out.println("BbsController:"+model);
		return "community/together";
	}
//투게더 입력
	@RequestMapping(value = "/community_together/add",method = RequestMethod.POST)
	public String communityTogetherAdd(@ModelAttribute CommunityVo bean,@RequestParam("file2")MultipartFile CMNT_FILENAME) throws SQLException {
		String uploadDir2="C:\\java\\workspace6\\tsigner\\src\\main\\webapp\\upload\\";
		
		long time=System.currentTimeMillis();
		String origin=CMNT_FILENAME.getOriginalFilename();
		String newName=time+origin;
		System.out.println("파일이름:"+newName);
		bean.setCmnt_filename(newName);
		bean.setCmnt_file_path3(uploadDir2);
		communityService.TogetherAdd(bean);
		System.out.println("추가 리스트:"+bean);
		File file=new File(uploadDir2+newName);

		try {
			CMNT_FILENAME.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(bean.toString());
		return "redirect:/community_together";
	}
	
//투게더 디테일
	@GetMapping(value = "/community_togetherDetail/{idx}")
	public String communityTogetherDetail(@PathVariable("idx") int cmnt_seq,Model model) throws SQLException {
		communityService.TogetherDetail(model,cmnt_seq);
		communityService.TogetherDetailCnt(cmnt_seq);
		communityService.TogetherReplyList(model,cmnt_seq);
		System.out.println("togetherDetailController:"+model);
		return "community/togetherDetail";
	}
	
	
	@RequestMapping(value = "/community_togetherDetail/delete/{idx}",method = RequestMethod.GET)
	public String communityTogetherDelete(@PathVariable("idx") int cmnt_seq) throws SQLException {
		System.out.println("delete로 넘어옴"+cmnt_seq);
		communityService.TogetherDelete(cmnt_seq);
		return "redirect:/community_together";
	}
	
	@RequestMapping(value = "/community_togetherDetail/reply",method = RequestMethod.GET)
	public String communityTogetherReply(@ModelAttribute CommunityVo bean,HttpServletRequest res) throws SQLException{
		communityService.TogetherReplyAdd(bean);
		String num=res.getParameter("cmnt_seq");
		return "redirect:/community_togetherDetail/"+num+"";
	}
	
	@RequestMapping(value = "/community_togetherDetail/replyDelete")
	public String communityTogetherReplyDelete(@RequestParam("cmnt_seq") int cmnt_seq,@RequestParam("reply_seq") int reply_seq) throws SQLException {
		communityService.TogetherReplyDelete(reply_seq);
		return "redirect:/community_togetherDetail/"+cmnt_seq+"";
	}
	
	
	@RequestMapping(value = "/community_togetherDetail/assignment",method = RequestMethod.GET)
	public void communityTogetherAssignment(@ModelAttribute() CommunityVo bean, HttpServletRequest res,HttpServletResponse resp) throws SQLException, IOException{
		String num=res.getParameter("cmnt_seq");
		String assign_id=res.getParameter("assign_id");
		if(communityService.idCheck(assign_id)==null){
			communityService.TogetherAssignmentAdd(bean);
		}else {
			resp.getWriter().write("assignFail");
		}
	}
	
}
