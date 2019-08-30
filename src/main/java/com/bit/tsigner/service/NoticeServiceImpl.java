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
		// 검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		// BETWEEN #{start}, #{end}에 입력 될 값을 맵에
		map.put("start", start-1);		//limit 0, 10 이렇게 하려면 start-1해줘야함 
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
		Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
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
//		//세션에 저장된 조회시간 검색
//		//최초로 조회할 경우 세선에 저장된 값이 없기 때문에 if문은 실행 안한다.
//		if(session.getAttribute("update_time"+idx) != null) {
//			
//			update_time = (long)session.getAttribute("updaet_time"+idx);
//		}
//		//시스템의 현재시간을 current_time에 저장
//		long current_time = System.currentTimeMillis();
//		//일정시간이 경과 후 조회수 증가 처리 
		
		sqlSession.getMapper(NoticeDao.class).increaseCnt(idx);
		
		
	}


	// 07. 게시글 레코드 갯수
		@Override
		public int countArticle(String searchOption, String keyword) throws SQLException {
			// 검색옵션, 키워드 맵에 저장
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			
			
			return sqlSession.getMapper(NoticeDao.class).countArticle(map);
			
			
		}
		
		//////////////////////// event 

		@Override
		public List<EventVo> eventSelectAll(int start, int end, String searchOption, String keyword) throws SQLException{
				// 검색옵션, 키워드 맵에 저장
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("searchOption", searchOption);
				map.put("keyword", keyword);
				
				map.put("start", start-1);		//limit 0, 10 이렇게 하려면 start-1해줘야함 
				map.put("end", end);	
				
				return sqlSession.getMapper(NoticeDao.class).eventSelectAll(map);
		}

		@Override
		public int eventCountArticle(String searchOption, String keyword) throws SQLException {
			// 검색옵션, 키워드 맵에 저장
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
			Map<String, Object> map = new HashMap<String, Object>();	//Map에 파라미터 넣기
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
