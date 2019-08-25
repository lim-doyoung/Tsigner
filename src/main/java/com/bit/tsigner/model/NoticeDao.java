package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.bit.tsigner.model.entity.NoticeVo;

public interface NoticeDao {
	List<NoticeVo> selectAll() throws SQLException;
	List<NoticeVo> selectAll(Map<String, Integer>map) throws SQLException;
	void insertOne(NoticeVo bean) throws SQLException;
	NoticeVo selectOne(int idx) throws SQLException;
	void updateOne(Map<String, Object> map) throws SQLException;
	int deleteOne(int idx) throws SQLException;

	void increaseCnt(int idx) throws SQLException;
//	void insertOne(String upload_files)throws SQLException;
	

	
	
	
	
}
