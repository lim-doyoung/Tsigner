package com.bit.tsigner.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.BookingDao;

@Service
public class BookingServiceImpl implements BookingService {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void getList(Model model) throws SQLException {
		model.addAttribute("alist", sqlSession.getMapper(BookingDao.class).selectAll());
	}
}
