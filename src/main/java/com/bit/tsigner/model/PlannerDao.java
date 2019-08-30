package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.PlannerVo;


public interface PlannerDao {
	
	//��,��,�� �ڵ弼��
	List<PlannerVo> searchCode(String areaCode)throws SQLException;

	//planMgt����
	void insertMgt(Map<String, Object> mgtMap)throws SQLException;

	//planMst����
	void insertMst(Map<String, Object> mstMap)throws SQLException;

	//planDtl����
	void insertDtl(Map<String, Object> dtlMap)throws SQLException;

	//�÷��ڵ����
	String createCode()throws SQLException;

	//������Ʈ�� ���������� ����
	void deleteData(String plan_code)throws SQLException;

	void updateMgt(Map<String, Object> mgtMap)throws SQLException;
	
	

}
