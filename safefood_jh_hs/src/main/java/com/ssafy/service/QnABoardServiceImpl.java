package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.QnABoardDao;
import com.ssafy.vo.Board;
import com.ssafy.vo.Comment;
import com.ssafy.vo.Food;
import com.ssafy.vo.PageBean;


@Service
public class QnABoardServiceImpl implements QnABoardService{

	@Autowired
	QnABoardDao dao;

	@Override
	public int insertQnABoard(Board board) {
		return dao.insertQnABoard(board);
	}

	@Override
	public int updateQnABoard(Board board) {
		return dao.updateQnABoard(board);
	}

	@Override
	public int deleteQnABoard(String no) {
		return dao.deleteQnABoard(no);
	}

	@Override
	public Board searchQnABoard(String no) {
		return dao.searchQnABoard(no);
	}

	@Override
	public List<Board> searchQnAall(PageBean bean) {
		return dao.searchQnAAll(bean);
	}

	@Override
	public int count() {
		return dao.count();
	}

	@Override
	public List<Comment> commentlistByno(int no) {
		return dao.commentlistByno(no);
	}

	@Override
	public int commentinsert(Comment comment) {
		return dao.commentinsert(comment);
	}

	@Override
	public int commentdelete(int commentno) {
		return dao.commentdelete(commentno);
	}

	@Override
	public Food sumFood(String a) {
		return dao.sumFood(a);
	}
	
}
