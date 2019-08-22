package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bit.tsigner.model.PlannerDao;
import com.bit.tsigner.model.entity.PlannerVo;


@Service
public class PlannerServiceImpl implements PlannerService{

	@Inject
	SqlSession sqlSession;
//	PlannerDao plannerDao;

	@Override
	public List<PlannerVo> searchCode(String areaCode) throws SQLException{
		
		return sqlSession.getMapper(PlannerDao.class).searchCode(areaCode);
	}


	
	
}
