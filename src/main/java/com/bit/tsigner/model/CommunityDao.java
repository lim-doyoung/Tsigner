package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.TestVo;

public interface CommunityDao {

	List<CommunityVo> selectAll() throws SQLException;
	void insertOne(CommunityVo bean) throws SQLException;
}
