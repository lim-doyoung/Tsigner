package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;
import com.bit.tsigner.model.entity.TestVo;

public interface CommunityDao {

	List<CommunityVo> selectAll() throws SQLException;
	void insertOne(CommunityVo bean) throws SQLException;
	CommunityVo selectOne(int num) throws SQLException;
	void selectOneCnt(int cmnt_seq) throws SQLException;
	void deleteOne(int cmnt_seq) throws SQLException;
	void editOne(CommunityVo bean) throws SQLException;
	
	List<CommunityVo> togetherSelectAll() throws SQLException;
	void togetherInsertOne(CommunityVo bean) throws SQLException;
	CommunityVo togetherSelectOne(int cmnt_seq) throws SQLException;
	void togetherSelectOneCnt(int cmnt_seq) throws SQLException;
	void togetherDeleteOne(int cmnt_seq) throws SQLException;
	void togetherReplyAdd(CommunityVo bean) throws SQLException;
	List<CommunityVo> togetherReply(int cmnt_seq) throws SQLException;
	void togetherReplyDelete(int reply_seq) throws SQLException;
	void togetherAssignmentAdd(CommunityVo bean);
	String AssignmentIdcheck(String assign_id); 
}
