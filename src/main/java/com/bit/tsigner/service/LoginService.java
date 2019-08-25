package com.bit.tsigner.service;

import java.util.Map;

import com.bit.tsigner.model.entity.LoginVo;

public interface LoginService {
	LoginVo login(Map<String, String> map) throws Exception;
	void join(Map<String, Object> map) throws Exception;
	void join_level_mgt(Map<String, Object> map) throws Exception;
	String idCheck(String id) throws Exception;
}

