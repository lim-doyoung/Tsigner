package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;

public interface CommunityService {
	//커뮤니티 자유게시판
	List<CommunityVo> list() throws SQLException;
	void add(CommunityVo bean) throws SQLException;
	CommunityVo detail(int num) throws SQLException;
	void detailCnt(int cmnt_seq) throws SQLException;
	void delete(int cmnt_seq) throws SQLException;
	void update(CommunityVo bean) throws SQLException;
	void list(Model model) throws SQLException;
	
	//커뮤니티 투게더
	void TogetherList(Model model) throws SQLException;
	void TogetherAdd(CommunityVo bean) throws SQLException;
	void TogetherDetail(Model model, int cmnt_seq) throws SQLException;
	void TogetherDelete(int cmnt_seq) throws SQLException;
	void TogetherDetailCnt(int cmnt_seq) throws SQLException;
	void TogetherReplyAdd(CommunityVo bean) throws SQLException;
	void TogetherReplyList(Model model, int cmnt_seq) throws SQLException;
	void TogetherReplyDelete(int reply_seq) throws SQLException;
	void TogetherAssignmentAdd(CommunityVo bean);
	String idCheck(String assign_id);
	

}
