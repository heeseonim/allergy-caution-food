package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.vo.Board;
import com.ssafy.vo.PageBean;



@Repository
public class QnABoardDaoImpl implements QnABoardDao{
	
	private final String namespace = "com.ssafy.mapper.QnAMapper.";
	
	@Autowired
	SqlSession session;

	@Override
	public int getQnABoardNo() {
		return session.selectOne(namespace+"getQnABoardNo");
	}

	@Override
	public int insertQnABoard(Board board) {
		return session.insert(namespace+"insertQnABoard",board);
	}

	@Override
	public Board searchQnABoard(String no) {
		return session.selectOne(namespace + "searchQnABoard", no);
	}

	@Override
	public List<Board> searchQnAAll(PageBean bean) {
		List<Board> result = session.selectList(namespace+"searchQnAall");
		return result;
	}

	@Override
	public int count() {
		return session.selectOne(namespace+"count");
	}

	@Override
	public int updateQnABoard(Board board) {
		return session.update(namespace + "updateQnABoard", board);
	}

	@Override
	public int deleteQnABoard(String no) {
		return session.delete(namespace + "deleteQnABoard", no);
	}

}
