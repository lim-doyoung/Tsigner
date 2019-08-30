package com.bit.tsigner.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public String saveData(List<Map<String, Object>> mgtList, List<Map<String, Object>> mstList,List<Map<String, Object>> dtlList) throws SQLException{
		
		boolean planCodeYn=true;
		String plan_code=(String)mgtList.get(0).get("plan_code");
		
		
		if(mgtList.get(0).get("plan_code")==null || "".equals(mgtList.get(0).get("plan_code"))) {
			planCodeYn=false;
			plan_code=sqlSession.getMapper(PlannerDao.class).createCode();
		}else {
			plan_code=(String)mgtList.get(0).get("plan_code");
			sqlSession.getMapper(PlannerDao.class).deleteData(plan_code);
		}
		
			Map<String, Object> mgtMap=new HashMap<String, Object>();
			
			mgtMap.put("plan_code", plan_code);
			mgtMap.put("user_id", mgtList.get(0).get("user_id"));
			mgtMap.put("tot_amt", mgtList.get(0).get("tot_amt"));
			mgtMap.put("trv_from_date", mgtList.get(0).get("trv_from_date"));
			mgtMap.put("trv_to_date", mgtList.get(0).get("trv_to_date"));
			mgtMap.put("tot_dist", mgtList.get(0).get("tot_dist"));
			
			if(planCodeYn==false) {
				sqlSession.getMapper(PlannerDao.class).insertMgt(mgtMap);
			}else {
				sqlSession.getMapper(PlannerDao.class).updateMgt(mgtMap);
			}
			
			for(int i=0;i<mstList.size();i++) {
				Map<String, Object> mstMap=new HashMap<String, Object>();
				
				mstMap.put("plan_code", plan_code);
				mstMap.put("trv_deg", mstList.get(i).get("trv_deg"));
				mstMap.put("trv_date", mstList.get(i).get("trv_date"));
				mstMap.put("day_dist", mstList.get(i).get("day_dist"));
				mstMap.put("day_amt", mstList.get(i).get("day_amt"));
				mstMap.put("day_room_chg", mstList.get(i).get("day_room_chg"));
				mstMap.put("day_food_exp", mstList.get(i).get("day_food_exp"));
				mstMap.put("day_tran_exp", mstList.get(i).get("day_tran_exp"));
				
				sqlSession.getMapper(PlannerDao.class).insertMst(mstMap);
			}
			
			for(int i=0;i<dtlList.size();i++) {
				Map<String, Object> dtlMap=new HashMap<String, Object>();
				
				dtlMap.put("plan_code", plan_code);
				dtlMap.put("loc_name", dtlList.get(i).get("loc_name"));
				dtlMap.put("loc_addr", dtlList.get(i).get("loc_addr"));
				dtlMap.put("loc_type", dtlList.get(i).get("loc_type"));
				dtlMap.put("trv_deg", dtlList.get(i).get("trv_deg"));
				dtlMap.put("loc_post_code", dtlList.get(i).get("loc_post_code"));
				dtlMap.put("position_x", dtlList.get(i).get("position_x"));
				dtlMap.put("position_y", dtlList.get(i).get("position_y"));
				dtlMap.put("loc_img_url", dtlList.get(i).get("loc_img_url"));
				dtlMap.put("content_id", dtlList.get(i).get("content_id"));
				dtlMap.put("loc_tel", dtlList.get(i).get("loc_tel"));
				dtlMap.put("overview", dtlList.get(i).get("overview"));
				dtlMap.put("loc_seq", dtlList.get(i).get("loc_seq"));
				
				sqlSession.getMapper(PlannerDao.class).insertDtl(dtlMap);
				
			}
			
			return plan_code;
	}
	
}
