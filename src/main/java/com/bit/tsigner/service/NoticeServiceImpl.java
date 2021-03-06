package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.HashMap;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.NoticeDao;
import com.bit.tsigner.model.entity.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void getList(Model model) throws SQLException {
		model.addAttribute("noticelist", sqlSession.getMapper(NoticeDao.class).selectAll());
		
	}

	@Override
	public void add(NoticeVo bean) throws SQLException {
		
		bean.setNoti_title(bean.getNoti_title());
		bean.setNoti_writer_id(bean.getNoti_writer_id());
		bean.setRegi_date(bean.getRegi_date());
		bean.setNoti_hits(bean.getNoti_hits());
		bean.setNoti_file_path1(bean.getNoti_file_path1());
		
		
		
		sqlSession.getMapper(NoticeDao.class).insertOne(bean);
		
	}

	@Override
	public void detail(Model model, int idx) throws SQLException {
		model.addAttribute("noticedetail",sqlSession.getMapper(NoticeDao.class).selectOne(idx));
		
	}


	@Override
	public void update(int idx, String sub, String content) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
		map.put("idx", idx);
		map.put("sub", sub);
		map.put("content", content);
		
		sqlSession.getMapper(NoticeDao.class).updateOne(map);
	
	}
	
	@Override
	public void delete(int idx) throws SQLException {
		sqlSession.getMapper(NoticeDao.class).deleteOne(idx);
			
	}
	
	@Override
	public void viewcnt(int idx) throws SQLException {
//		long update_time = 0;
//		//세션에 저장된 조회시간 검색
//		//최초로 조회할 경우 세선에 저장된 값이 없기 때문에 if문은 실행 안한다.
//		if(session.getAttribute("update_time"+idx) != null) {
//			
//			update_time = (long)session.getAttribute("updaet_time"+idx);
//		}
//		//시스템의 현재시간을 current_time에 저장
//		long current_time = System.currentTimeMillis();
//		//일정시간이 경과 후 조회수 증가 처리 
		
		sqlSession.getMapper(NoticeDao.class).increaseCnt(idx);
		
		
	}

//	@Override
//	public void upload(String upload_files) throws SQLException {
//		
//		sqlSession.getMapper(NoticeDao.class).insertOne(upload_files);
//	}

	



	

	

}
