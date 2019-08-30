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
//커뮤니티 자유게시판	
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
//커뮤니티 투게더
	@Override
	public void TogetherAdd(CommunityVo bean) throws SQLException {
		bean.setCmnt_seq(bean.getCmnt_seq());
		bean.setCmnt_title(bean.getCmnt_title());
		bean.setCmnt_content(bean.getCmnt_content());
		bean.setCmnt_writer_id(bean.getCmnt_writer_id());
		bean.setRecru_per(bean.getRecru_per());
		bean.setTotal_per(bean.getTotal_per());
		bean.setHash_tag(bean.getHash_tag());
		bean.setTogether_date(bean.getTogether_date());
		bean.setCmnt_writer_id(bean.getCmnt_writer_id());
		bean.setCmnt_filename(bean.getCmnt_filename());
		bean.setCmnt_file_path3(bean.getCmnt_file_path3());
		bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
		bean.setModi_date(new Timestamp(System.currentTimeMillis()));
		sqlsession.getMapper(CommunityDao.class).togetherInsertOne(bean);
		System.out.println("add:"+bean);
		
	}

	@Override
	public void TogetherList(Model model) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("service:"+model);
		model.addAttribute("togetherAlist",sqlsession.getMapper(CommunityDao.class).togetherSelectAll());
	}

	@Override
	public void TogetherDetail(Model model, int cmnt_seq) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("togetherDetail:"+model);
		model.addAttribute("bean", sqlsession.getMapper(CommunityDao.class).togetherSelectOne(cmnt_seq));
	}
	@Override
	public void TogetherDetailCnt(int cmnt_seq) throws SQLException {
		sqlsession.getMapper(CommunityDao.class).togetherSelectOneCnt(cmnt_seq);
	}

	@Override
	public void TogetherDelete(int cmnt_seq) throws SQLException {
		System.out.println("delete serverse 넘어옴");
		sqlsession.getMapper(CommunityDao.class).togetherDeleteOne(cmnt_seq);
	}

	@Override
	public void TogetherReplyAdd(CommunityVo bean) throws SQLException {
		bean.setCmnt_seq(bean.getCmnt_seq());
		bean.setReply_seq(bean.getReply_seq());
		bean.setReply_id(bean.getReply_id());
		bean.setReply_content(bean.getReply_content());
		bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
		bean.setModi_date(new Timestamp(System.currentTimeMillis()));
		sqlsession.getMapper(CommunityDao.class).togetherReplyAdd(bean);
		// TODO Auto-generated method stub
		
	}
	@Override
	public void TogetherReplyList(Model model, int cmnt_seq) throws SQLException {
		// TODO Auto-generated method stub
		model.addAttribute("replyList",sqlsession.getMapper(CommunityDao.class).togetherReply(cmnt_seq));
	}

	@Override
	public void TogetherReplyDelete(int reply_seq) throws SQLException {
		// TODO Auto-generated method stub
		sqlsession.getMapper(CommunityDao.class).togetherReplyDelete(reply_seq);
	}
	//assignment 등록
	@Override
	public void TogetherAssignmentAdd(CommunityVo bean) {
		bean.setRegi_date(new Timestamp(System.currentTimeMillis()));
		bean.setModi_date(new Timestamp(System.currentTimeMillis()));
		sqlsession.getMapper(CommunityDao.class).togetherAssignmentAdd(bean);
	}
	//assignment id 중복 체크
	@Override
	public String idCheck(String assign_id) {
		return sqlsession.getMapper(CommunityDao.class).AssignmentIdcheck(assign_id);
	}

}
