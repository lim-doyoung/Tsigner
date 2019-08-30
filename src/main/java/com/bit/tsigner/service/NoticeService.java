package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.NoticeVo;

public interface NoticeService {

	//void getList(Model model) throws SQLException;
	//게시글 전체 목록
	List<NoticeVo> selectAll(int start, int end, String searchOption, String keyword)throws SQLException;
	
	void add(NoticeVo bean) throws SQLException;

	void detail(Model model, int idx) throws SQLException;
	
	void update(int idx, String sub, String content) throws SQLException;
	
	void delete(int idx) throws SQLException;

	void viewcnt(int idx) throws SQLException;

	int countArticle(String searchOption, String keyword) throws SQLException;
	
	///////////////// event /////////////////

	List<EventVo> eventSelectAll(int start, int end, String searchOption, String keyword) throws SQLException;

	int eventCountArticle(String searchOption, String keyword) throws SQLException;

	void eventAdd(EventVo bean) throws SQLException;

	void eventDetail(Model model, int idx) throws SQLException;

	void eventViewcnt(int idx) throws SQLException;

	void eventUpdate(int idx, String sub, String content) throws SQLException;

	void eventDelete(int idx) throws SQLException;

	

	

	



	

}
