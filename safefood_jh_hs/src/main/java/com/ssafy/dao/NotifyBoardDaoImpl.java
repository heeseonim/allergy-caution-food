package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.vo.Board;
import com.ssafy.vo.Comment;
import com.ssafy.vo.PageBean;

@Repository
public class NotifyBoardDaoImpl implements NotifyBoardDao {
	
	@Autowired
	SqlSession session;
	
	private final String namespace = "com.ssafy.mapper.NotifyMapper.";

	@Override
	public int getNotifyBoardNo() {
		return session.selectOne(namespace+"getNotifyBoardNo");
	}

	@Override
	public int insertNotifyBoard(Board board) {
		return session.insert(namespace+"insertNotifyBoard", board);
	}

	@Override
	public Board searchNotifyBoard(String no) {
		return session.selectOne(namespace+"searchNotifyBoard", no);
	}

	@Override
	public List<Board> searchNotifyAll(PageBean bean) {
		return session.selectList(namespace+"searchNotifyAll", bean);
	}

	@Override
	public int count() {
		return 0;
	}

	@Override
	public int updateNotifyBoard(Board board) {
		return session.update(namespace+"updateNotifyBoard", board);
	}

	@Override
	public int deleteNotifyBoard(String no) {
		return session.delete(namespace+"deleteNotifyBoard", no);
	}


}
