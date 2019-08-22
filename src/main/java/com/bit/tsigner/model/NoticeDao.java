package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.NoticeVo;

public interface NoticeDao {
	List<NoticeVo> selectAll() throws SQLException;
	List<NoticeVo> selectAll(Map<String, Integer>map) throws SQLException;
	void insertOne(NoticeVo bean) throws SQLException;
	NoticeVo selectOne(int idx) throws SQLException;
	
}
