package com.bit.tsigner.service;

import java.sql.SQLException;


import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.NoticeVo;

public interface NoticeService {

	void getList(Model model) throws SQLException;

	void add(NoticeVo bean) throws SQLException;

	void detail(Model model, int idx) throws SQLException;
	
	void update(int idx, String sub, String content)throws SQLException;
	
	void delete(int idx) throws SQLException;

	void viewcnt(int idx) throws SQLException;

	//void upload(String upload_files) throws SQLException;

	



	

}
