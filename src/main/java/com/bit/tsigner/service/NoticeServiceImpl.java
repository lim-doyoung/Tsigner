package com.bit.tsigner.service;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.tsigner.model.NoticeDao;
import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Inject
	SqlSession sqlSession;

//	@Override
//	public void getList(Model model) throws SQLException {
//		model.addAttribute("noticelist", sqlSession.getMapper(NoticeDao.class).selectAll());
//		
//	}
	
	@Override
	public List<NoticeVo> selectAll(int start, int end, String searchOption, String keyword) throws SQLException {
		// �˻��ɼ�, Ű���� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		// BETWEEN #{start}, #{end}�� �Է� �� ���� �ʿ�
		map.put("start", start-1);		//limit 0, 10 �̷��� �Ϸ��� start-1������� 
		map.put("end", end);	
		//System.out.println("service"+(start-1));
 		
		//return sqlSession.getMapper(NoticeDao.class).selectAll(start, end, searchOption, keyword);
		//return sqlSession.getMapper(NoticeDao.class).selectAll("notice.getList", map);
		//return sqlSession.selectList("notice.getList", map);
		return sqlSession.getMapper(NoticeDao.class).selectAll(map);
	}

	@Override
	public void add(NoticeVo bean) throws SQLException {
		
		bean.setNoti_title(bean.getNoti_title());
		bean.setNoti_writer_id(bean.getNoti_writer_id());
		bean.setRegi_date(bean.getRegi_date());
		bean.setNoti_hits(bean.getNoti_hits());
		bean.setNoti_file_path1(bean.getNoti_file_path1());
		
		
		
		sqlSession.getMapper(NoticeDao.class).insertOne(bean);
		
	}

	@Override
	public void detail(Model model, int idx) throws SQLException {
		model.addAttribute("noticedetail",sqlSession.getMapper(NoticeDao.class).selectOne(idx));
		
	}


	@Override
	public void update(int idx, String sub, String content) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();	//Map�� �Ķ���� �ֱ�
		map.put("idx", idx);
		map.put("sub", sub);
		map.put("content", content);
		
		sqlSession.getMapper(NoticeDao.class).updateOne(map);
	
	}
	
	@Override
	public void delete(int idx) throws SQLException {
		sqlSession.getMapper(NoticeDao.class).deleteOne(idx);
			
	}
	
	@Override
	public void viewcnt(int idx) throws SQLException {
//		long update_time = 0;
//		//���ǿ� ����� ��ȸ�ð� �˻�
//		//���ʷ� ��ȸ�� ��� ������ ����� ���� ���� ������ if���� ���� ���Ѵ�.
//		if(session.getAttribute("update_time"+idx) != null) {
//			
//			update_time = (long)session.getAttribute("updaet_time"+idx);
//		}
//		//�ý����� ����ð��� current_time�� ����
//		long current_time = System.currentTimeMillis();
//		//�����ð��� ��� �� ��ȸ�� ���� ó�� 
		
		sqlSession.getMapper(NoticeDao.class).increaseCnt(idx);
		
		
	}


	// 07. �Խñ� ���ڵ� ����
		@Override
		public int countArticle(String searchOption, String keyword) throws SQLException {
			// �˻��ɼ�, Ű���� �ʿ� ����
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			
			
			return sqlSession.getMapper(NoticeDao.class).countArticle(map);
			
			
		}
		
		//////////////////////// event 

		@Override
		public List<EventVo> eventSelectAll(int start, int end, String searchOption, String keyword) throws SQLException{
				// �˻��ɼ�, Ű���� �ʿ� ����
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("searchOption", searchOption);
				map.put("keyword", keyword);
				
				map.put("start", start-1);		//limit 0, 10 �̷��� �Ϸ��� start-1������� 
				map.put("end", end);	
				
				return sqlSession.getMapper(NoticeDao.class).eventSelectAll(map);
		}

		@Override
		public int eventCountArticle(String searchOption, String keyword) throws SQLException {
			// �˻��ɼ�, Ű���� �ʿ� ����
						Map<String, String> map = new HashMap<String, String>();
						map.put("searchOption", searchOption);
						map.put("keyword", keyword);
						
						
						return sqlSession.getMapper(NoticeDao.class).eventCountArticle(map);
		}

		@Override
		public void eventAdd(EventVo bean) throws SQLException {
			bean.setEvent_title(bean.getEvent_title());
			bean.setEvent_writer_id(bean.getEvent_writer_id());
			bean.setRegi_date(bean.getRegi_date());
			bean.setEvent_hits(bean.getEvent_hits());
			bean.setEvent_file_path1(bean.getEvent_file_path1());
			
			
			
			sqlSession.getMapper(NoticeDao.class).eventInsertOne(bean);
			
		}

		@Override
		public void eventDetail(Model model, int idx) throws SQLException {
			model.addAttribute("eventdetail",sqlSession.getMapper(NoticeDao.class).eventSelectOne(idx));
			
		}

		@Override
		public void eventViewcnt(int idx) throws SQLException {
			sqlSession.getMapper(NoticeDao.class).eventIncreaseCnt(idx);
			
		}

		@Override
		public void eventUpdate(int idx, String sub, String content) throws SQLException {
			Map<String, Object> map = new HashMap<String, Object>();	//Map�� �Ķ���� �ֱ�
			map.put("idx", idx);
			map.put("sub", sub);
			map.put("content", content);
			
			sqlSession.getMapper(NoticeDao.class).eventUpdateOne(map);
			
		}

		@Override
		public void eventDelete(int idx) throws SQLException {
			sqlSession.getMapper(NoticeDao.class).eventDeleteOne(idx);
			
		}

	



	

	

}
