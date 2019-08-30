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
   
   String uploadDir="C:\\java\\workspace5\\tsigner\\src\\main\\webapp\\upload\\";	//upload ���� ����Ǵ� �ּ�
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   // �Խñ� ����Ʈ
//   @RequestMapping(value = "/notice" )
//   public String notice(Model model) throws SQLException {
//      
//      logger.debug("��������");
//
//      noticeService.getList(model);
//      
//      return "notice/notice";
//   }
   
   @RequestMapping(value="/notice")
   // defaultValue = "1" -> �⺻ �� �Ҵ� : ������������ 1�� �ʱ�ȭ 
   public ModelAndView notice(@RequestParam(defaultValue = "all") String searchOption,
                     @RequestParam(defaultValue="") String keyword,
                     @RequestParam(defaultValue = "1") int curPage) throws SQLException{
      // ���ڵ��� ���� ���
      int count = noticeService.countArticle(searchOption, keyword);
      
      //������ ������
      BoardPager boardPager = new BoardPager(count, curPage);
      int start = boardPager.getPageBegin();
      System.out.println(start);
      int end = boardPager.getPageEnd();
      
      List<NoticeVo> list= noticeService.selectAll(start, end, searchOption,keyword);
      
      //�����͸� �ʿ� ����
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);   //list
      map.put("count", count);   //���ڵ��� ����
      map.put("searchOption", searchOption);   //�˻� �ɼ�
      map.put("keyword", keyword);   //�˻� Ű����
      map.put("boardPager", boardPager);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("map", map);   //�ʿ� ����� �����͸� mav�� ����
      mav.setViewName("notice/notice");    //�並 notice.jsp�� ����
      
      return mav;   //notice.jsp�� List ���޵ȴ� 
      
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
			newName=time+origin;	//���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�
			
			bean.setNoti_file_path1(newName);	//�����н�1�� ���ϸ� �־��ֱ�
			
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
   
 //�Խñ� �󼼺���
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
   // defaultValue = "1" -> �⺻ �� �Ҵ� : ������������ 1�� �ʱ�ȭ 
   public ModelAndView event(@RequestParam(defaultValue = "all") String searchOption,
                     @RequestParam(defaultValue="") String keyword,
                     @RequestParam(defaultValue = "1") int curPage) throws SQLException{
      // ���ڵ��� ���� ���
      int count = noticeService.eventCountArticle(searchOption, keyword);
      
      //������ ������
      BoardPager boardPager = new BoardPager(count, curPage);
      int start = boardPager.getPageBegin();
      System.out.println(start);
      int end = boardPager.getPageEnd();
      
      List<EventVo> list= noticeService.eventSelectAll(start, end, searchOption,keyword);
      
      //�����͸� �ʿ� ����
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);   //list
      map.put("count", count);   //���ڵ��� ����
      map.put("searchOption", searchOption);   //�˻� �ɼ�
      map.put("keyword", keyword);   //�˻� Ű����
      map.put("boardPager", boardPager);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("map", map);   //�ʿ� ����� �����͸� mav�� ����
      mav.setViewName("notice/event");    //�並 event.jsp�� ����
      
      return mav;   //event.jsp�� List ���޵ȴ� 
      
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
			newName=time+origin;	//���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�
			
			bean.setEvent_file_path1(newName);	//�����н�1�� ���ϸ� �־��ֱ�
			
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
   
 //�Խñ� �󼼺���
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