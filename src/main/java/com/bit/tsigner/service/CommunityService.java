package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;

public interface CommunityService {
	List<CommunityVo> list() throws SQLException;
	void add(CommunityVo bean) throws SQLException;
	CommunityVo detail(int num) throws SQLException;
	void detailCnt(int cmnt_seq) throws SQLException;
	void delete(int cmnt_seq) throws SQLException;
	void update(CommunityVo bean) throws SQLException;
	void list(Model model) throws SQLException;

}
