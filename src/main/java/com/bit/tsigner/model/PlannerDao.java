package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.PlannerVo;


public interface PlannerDao {
	
	//시,군,구 코드세팅
	List<PlannerVo> searchCode(String areaCode)throws SQLException;

	//planMgt저장
	void insertMgt(Map<String, Object> mgtMap)throws SQLException;

	//planMst저장
	void insertMst(Map<String, Object> mstMap)throws SQLException;

	//planDtl저장
	void insertDtl(Map<String, Object> dtlMap)throws SQLException;

	//플랜코드생성
	String createCode()throws SQLException;

	//업데이트시 이전정보들 삭제
	void deleteData(String plan_code)throws SQLException;

	void updateMgt(Map<String, Object> mgtMap)throws SQLException;
	
	

}
