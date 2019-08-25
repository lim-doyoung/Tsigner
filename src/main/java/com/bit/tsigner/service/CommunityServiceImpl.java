package com.bit.tsigner.service;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.CommunityDao;
import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void list(Model model) throws SQLException {
		// TODO Auto-generated method stub
//		model.addAttribute(page);
		System.out.println("service:"+model);
		model.addAttribute("alist",sqlsession.getMapper(CommunityDao.class).selectAll());
	}
	
	@Override
	public List<CommunityVo> list() throws SQLException {
		// TODO Auto-generated method stub
		CommunityVo bean=new CommunityVo();
		bean.setCmnt_seq(bean.getCmnt_seq());
		bean.setCmnt_title(bean.getCmnt_title());
		bean.setCmnt_content(bean.getCmnt_content());
		bean.setCmnt_writer_id(bean.getCmnt_content());
		bean.setCmnt_hits(bean.getCmnt_hits());
		bean.setModi_date(bean.getModi_date());
		System.out.println(sqlsession.getMapper(CommunityDao.class).selectAll());
		return sqlsession.getMapper(CommunityDao.class).selectAll();
	}

	@Override
	public void add(CommunityVo bean) throws SQLException {
		// TODO Auto-generated method stub
		bean.setCmnt_seq(bean.getCmnt_seq());
		bean.setCmnt_title(bean.getCmnt_title());
		bean.setCmnt_content(bean.getCmnt_content());
		bean.setCmnt_writer_id(bean.getCmnt_writer_id());
		bean.setCmnt_filename(bean.getCmnt_filename());
		bean.setCmnt_file_path2(bean.getCmnt_file_path2());
		bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
		bean.setModi_date(new Timestamp(System.currentTimeMillis()));
		sqlsession.getMapper(CommunityDao.class).insertOne(bean);
		System.out.println("add:"+bean);
		
	}

	@Override
	public CommunityVo detail(int cmnt_seq) throws SQLException {
		return (CommunityVo) sqlsession.getMapper(CommunityDao.class).selectOne(cmnt_seq);
	}

	public void detailCnt(int cmnt_seq) throws SQLException {
		sqlsession.getMapper(CommunityDao.class).selectOneCnt(cmnt_seq);
	}

	@Override
	public void delete(int cmnt_seq) throws SQLException {
		sqlsession.getMapper(CommunityDao.class).deleteOne(cmnt_seq);
	}

	@Override
	public void update(CommunityVo bean) throws SQLException {
		// TODO Auto-generated method stub
		bean.setCmnt_seq(bean.getCmnt_seq());
		bean.setCmnt_title(bean.getCmnt_title());
		bean.setCmnt_content(bean.getCmnt_content());
		bean.setCmnt_writer_id(bean.getCmnt_content());
		bean.setModi_date(new Timestamp(System.currentTimeMillis()));
		System.out.println("update"+bean.toString());
		sqlsession.getMapper(CommunityDao.class).editOne(bean);
	}


}
