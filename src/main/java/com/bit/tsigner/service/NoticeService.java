package com.bit.tsigner.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.NoticeVo;

public interface NoticeService {

	void getList(Model model) throws SQLException;

	void add(NoticeVo bean) throws SQLException;

	void detail(Model model, int idx) throws SQLException;

}
