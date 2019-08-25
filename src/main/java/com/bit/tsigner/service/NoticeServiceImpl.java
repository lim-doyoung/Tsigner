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
		Map<String, Object> map = new HashMap<String, Object>();	//Map�� �Ķ���� �ֱ�
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
//		//���ǿ� ����� ��ȸ�ð� �˻�
//		//���ʷ� ��ȸ�� ��� ������ ����� ���� ���� ������ if���� ���� ���Ѵ�.
//		if(session.getAttribute("update_time"+idx) != null) {
//			
//			update_time = (long)session.getAttribute("updaet_time"+idx);
//		}
//		//�ý����� ����ð��� current_time�� ����
//		long current_time = System.currentTimeMillis();
//		//�����ð��� ��� �� ��ȸ�� ���� ó�� 
		
		sqlSession.getMapper(NoticeDao.class).increaseCnt(idx);
		
		
	}

//	@Override
//	public void upload(String upload_files) throws SQLException {
//		
//		sqlSession.getMapper(NoticeDao.class).insertOne(upload_files);
//	}

	



	

	

}
