package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.CommunityVo;

public interface CommunityService {
	void list(Model model) throws SQLException;
	void add(CommunityVo bean) throws SQLException;
	CommunityVo detail(int num) throws SQLException;
	void detailCnt(int cmnt_seq) throws SQLException;
	void delete(int cmnt_seq) throws SQLException;
}
