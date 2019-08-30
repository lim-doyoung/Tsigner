package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.tsigner.model.entity.PlannerVo;

public interface PlannerService {

	 List<PlannerVo> searchCode(String areaCode) throws SQLException;

	 String saveData(List<Map<String, Object>> mgtList, List<Map<String, Object>> mstList,List<Map<String, Object>> dtlList) throws SQLException;


}
