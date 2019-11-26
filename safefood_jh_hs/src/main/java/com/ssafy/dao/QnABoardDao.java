package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.Board;
import com.ssafy.vo.Comment;
import com.ssafy.vo.PageBean;


public interface QnABoardDao {
	public int getQnABoardNo();

	public int insertQnABoard(Board board);

	public Board searchQnABoard(String no);

	public List<Board> searchQnAAll(PageBean bean);

	public int count();

	public int updateQnABoard(Board board);

	public int deleteQnABoard(String no);
	//댓글
	public List<Comment> commentlistByno(int no);
	
	public int commentinsert(Comment comment);
	
	public int commentdelete(int commentno);
	
}
