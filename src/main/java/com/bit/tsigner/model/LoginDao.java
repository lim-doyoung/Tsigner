package com.bit.tsigner.model;

import java.util.Map;

import com.bit.tsigner.model.entity.LoginVo;

public interface LoginDao {
	
	LoginVo login(Map<String, String> map) throws Exception;
	void join(Map<String, Object> map) throws Exception;
	void join_level_mgt(Map<String, Object> map) throws Exception;
	void easyJoin(Map<String, Object> map) throws Exception;
	String idCheck(String id) throws Exception;
	String emailCheck(String email) throws Exception;
	String searchId(Map<String, String> map) throws Exception;
	Boolean searchPw(Map<String, String> map) throws Exception;
	void editPw(Map<String, String> map);
	LoginVo getUser(String id);
}
