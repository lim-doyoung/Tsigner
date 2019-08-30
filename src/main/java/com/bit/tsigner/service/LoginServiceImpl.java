package com.bit.tsigner.service;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bit.tsigner.model.LoginDao;
import com.bit.tsigner.model.entity.LoginVo;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public LoginVo login(Map<String, String> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).login(map);
	}

	@Override
	public void join(Map<String, Object> map) throws Exception {
		sqlSession.getMapper(LoginDao.class).join(map);
	}

	@Override
	public void join_level_mgt(Map<String, Object> map) throws Exception {
		sqlSession.getMapper(LoginDao.class).join_level_mgt(map);
	}

	@Override
	public String idCheck(String id) throws Exception {
		
		return sqlSession.getMapper(LoginDao.class).idCheck(id); 
	}

	@Override
	public String emailCheck(String email) throws Exception {
		return sqlSession.getMapper(LoginDao.class).emailCheck(email);
	}

	@Override
	public String searchId(Map<String, String> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).searchId(map);
	}

	@Override
	public Boolean searchPw(Map<String, String> map) throws Exception {
		return sqlSession.getMapper(LoginDao.class).searchPw(map);
	}

	@Override
	public void editPw(Map<String, String> map) {
		sqlSession.getMapper(LoginDao.class).editPw(map);
	}

	@Override
	public void easyJoin(Map<String, Object> map) throws Exception {
		sqlSession.getMapper(LoginDao.class).easyJoin(map);
	}

	@Override
	public LoginVo getUser(String id) throws Exception {
		return sqlSession.getMapper(LoginDao.class).getUser(id);
	}


}
