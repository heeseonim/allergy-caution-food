package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.vo.History;

@Repository
public class HistoryDaoImpl implements HistoryDao {
	
	@Autowired
	SqlSession session;
	
	private final String namespace = "com.ssafy.mapper.historyMapper.";
	
	
	@Override
	public List<History> selectHistory(String id) {
		return session.selectList(namespace+"selectHistory", id);
	}

	@Override
	public int insertHistory(History history) {
		return session.insert(namespace+"insertHistory", history);
	}

}
