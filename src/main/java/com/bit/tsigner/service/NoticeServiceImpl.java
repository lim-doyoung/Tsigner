package com.bit.tsigner.service;

import java.sql.SQLException;

import javax.inject.Inject;

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
		
		sqlSession.getMapper(NoticeDao.class).insertOne(bean);
		
	}

	@Override
	public void detail(Model model, int idx) throws SQLException {
		model.addAttribute("noticedetail",sqlSession.getMapper(NoticeDao.class).selectOne(idx));
		
	}

}
