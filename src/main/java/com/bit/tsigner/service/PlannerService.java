package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.List;

import com.bit.tsigner.model.entity.PlannerVo;

public interface PlannerService {

	 List<PlannerVo> searchCode(String areaCode) throws SQLException;


}
