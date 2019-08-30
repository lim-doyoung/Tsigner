package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.NoticeVo;

public interface NoticeDao {
//	List<NoticeVo> selectAll() throws SQLException;
//	List<NoticeVo> selectAll(Map<String, Integer>map) throws SQLException;
	
	//public List<NoticeVo> selectAll(int start, int end, String searchOption, String keyword)throws SQLException;
	void insertOne(NoticeVo bean) throws SQLException;
	NoticeVo selectOne(int idx) throws SQLException;
	void updateOne(Map<String, Object> map) throws SQLException;
	int deleteOne(int idx) throws SQLException;

	void increaseCnt(int idx) throws SQLException;
//	void insertOne(String upload_files)throws SQLException
	 List<NoticeVo> selectAll(Map<String, Object> map) throws SQLException ;
	int countArticle(Map<String, String> map) throws SQLException;
	
	/////////// event 
	
	List<EventVo> eventSelectAll(Map<String, Object> map) throws SQLException;
	int eventCountArticle(Map<String, String> map) throws SQLException;
	void eventInsertOne(EventVo bean) throws SQLException;
	EventVo eventSelectOne(int idx) throws SQLException;
	void eventIncreaseCnt(int idx) throws SQLException;
	void eventUpdateOne(Map<String, Object> map) throws SQLException;
	void eventDeleteOne(int idx) throws SQLException;
	
	
		
		
	

	
	
	
	
}
