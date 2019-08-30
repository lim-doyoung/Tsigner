package com.bit.tsigner.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.bit.tsigner.BoardPager;
import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.service.NoticeService;

@Controller
public class NoticeController {
   
   
   
   @Inject
   NoticeService noticeService;
   
   String uploadDir="C:\\java\\workspace5\\tsigner\\src\\main\\webapp\\upload\\";	//upload 파일 저장되는 주소
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   // 게시글 리스트
//   @RequestMapping(value = "/notice" )
//   public String notice(Model model) throws SQLException {
//      
//      logger.debug("공지사항");
//
//      noticeService.getList(model);
//      
//      return "notice/notice";
//   }
   
   @RequestMapping(value="/notice")
   // defaultValue = "1" -> 기본 값 할당 : 현재페이지를 1로 초기화 
   public ModelAndView notice(@RequestParam(defaultValue = "all") String searchOption,
                     @RequestParam(defaultValue="") String keyword,
                     @RequestParam(defaultValue = "1") int curPage) throws SQLException{
      // 레코드의 갯수 계산
      int count = noticeService.countArticle(searchOption, keyword);
      
      //페이지 나누기
      BoardPager boardPager = new BoardPager(count, curPage);
      int start = boardPager.getPageBegin();
      System.out.println(start);
      int end = boardPager.getPageEnd();
      
      List<NoticeVo> list= noticeService.selectAll(start, end, searchOption,keyword);
      
      //데이터를 맵에 저장
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);   //list
      map.put("count", count);   //레코드의 갯수
      map.put("searchOption", searchOption);   //검색 옵션
      map.put("keyword", keyword);   //검색 키워드
      map.put("boardPager", boardPager);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("map", map);   //맵에 저장된 데이터를 mav에 저장
      mav.setViewName("notice/notice");    //뷰를 notice.jsp로 설정
      
      return mav;   //notice.jsp로 List 전달된다 
      
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
   
////////////////////////////////////////////////////////////////////////////////////////
   
   //event
   @RequestMapping(value="/event")
   // defaultValue = "1" -> 기본 값 할당 : 현재페이지를 1로 초기화 
   public ModelAndView event(@RequestParam(defaultValue = "all") String searchOption,
                     @RequestParam(defaultValue="") String keyword,
                     @RequestParam(defaultValue = "1") int curPage) throws SQLException{
      // 레코드의 갯수 계산
      int count = noticeService.eventCountArticle(searchOption, keyword);
      
      //페이지 나누기
      BoardPager boardPager = new BoardPager(count, curPage);
      int start = boardPager.getPageBegin();
      System.out.println(start);
      int end = boardPager.getPageEnd();
      
      List<EventVo> list= noticeService.eventSelectAll(start, end, searchOption,keyword);
      
      //데이터를 맵에 저장
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);   //list
      map.put("count", count);   //레코드의 갯수
      map.put("searchOption", searchOption);   //검색 옵션
      map.put("keyword", keyword);   //검색 키워드
      map.put("boardPager", boardPager);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("map", map);   //맵에 저장된 데이터를 mav에 저장
      mav.setViewName("notice/event");    //뷰를 event.jsp로 설정
      
      return mav;   //event.jsp로 List 전달된다 
      
   }
   
   @RequestMapping(value="/event/add", method=RequestMethod.POST)
	public String eventAdd(@ModelAttribute EventVo bean) throws SQLException{
		
		System.out.println(bean.getEvent_title());
		System.out.println(bean.getEvent_content());
		System.out.println(bean.getUpload_files());
		
		
		String newName=null;
		
		for(MultipartFile file1 : bean.getUpload_files()) {
			if(file1 == null || file1.isEmpty())continue;
			logger.debug(file1.getOriginalFilename());
			
			long time= System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName=time+origin;	//파일명 중복 막기 위해 파일명 = 이름+시간
			
			bean.setEvent_file_path1(newName);	//파일패스1에 파일명 넣어주기
			
			System.out.println("newName"+bean.getEvent_file_path1());
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
		noticeService.eventAdd(bean);
		return "redirect:/event";
	}
   
 //게시글 상세보기
   @RequestMapping(value="/event/detail")
   public String eventDetail(Model model,@RequestParam("idx") int idx) throws SQLException{
      
      noticeService.eventDetail(model,idx);
      noticeService.eventViewcnt(idx);
      
      return "notice/eventDetail";
   }
   
   @RequestMapping(value="/event/update", method=RequestMethod.POST)
   public String eventUpdate(@ModelAttribute EventVo bean, @RequestParam("idx") int idx, @RequestParam("sub") String sub, @RequestParam("content") String content) throws SQLException{
      noticeService.eventUpdate(idx, sub, content);
      
      return "redirect:/event";
   }
   
   @RequestMapping(value="/event/delete", method=RequestMethod.POST)
   public String eventDelete(@RequestParam("idx") int idx) throws SQLException{
      noticeService.eventDelete(idx);
      return "redirect:/event";
   }

   


}