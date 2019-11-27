package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.NotifyBoardDao;
import com.ssafy.vo.Board;
import com.ssafy.vo.PageBean;

@Service
public class NotifyBoardServiceImpl implements NotifyBoardService {

	@Autowired
	NotifyBoardDao dao;
	
	@Override
	public int insertNotifyBoard(Board board) {
		return dao.insertNotifyBoard(board);
	}

	@Override
	public int updateNotifyBoard(Board board) {
		return dao.updateNotifyBoard(board);
	}

	@Override
	public int deleteNotifyBoard(String no) {
		return dao.deleteNotifyBoard(no);
	}

	@Override
	public Board searchNotifyBoard(String no) {
		return dao.searchNotifyBoard(no);
	}

	@Override
	public List<Board> searchNotifyall(PageBean bean) {
		return dao.searchNotifyAll(bean);
	}

	@Override
	public int count() {
		return dao.count();
	}
}
