package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.Board;
import com.ssafy.vo.PageBean;


public interface QnABoardDao {
	public int getQnABoardNo();

	public int insertQnABoard(Board board);

	public Board searchQnABoard(String no);

	public List<Board> searchQnAAll(PageBean bean);

	public int count();

	public int updateQnABoard(Board board);

	public int deleteQnABoard(String no);
}
