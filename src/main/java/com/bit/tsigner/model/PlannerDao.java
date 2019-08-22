package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.bit.tsigner.model.entity.PlannerVo;


public interface PlannerDao {
	
	List<PlannerVo> searchCode(String areaCode)throws SQLException;

}
