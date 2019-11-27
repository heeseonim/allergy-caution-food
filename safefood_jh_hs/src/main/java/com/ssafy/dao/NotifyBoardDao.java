package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.Board;
import com.ssafy.vo.Comment;
import com.ssafy.vo.PageBean;


public interface NotifyBoardDao {
	public int getNotifyBoardNo();

	public int insertNotifyBoard(Board board);

	public Board searchNotifyBoard(String no);

	public List<Board> searchNotifyAll(PageBean bean);

	public int count();

	public int updateNotifyBoard(Board board);

	public int deleteNotifyBoard(String no);
}
