package com.ssafy.service;

import java.util.List;


import com.ssafy.vo.Board;
import com.ssafy.vo.Comment;
import com.ssafy.vo.PageBean;

public interface NotifyBoardService {

	// 게시글 추가
	public int insertNotifyBoard(Board board);

	// 게시글 업데이트
	public int updateNotifyBoard(Board board);

	// 게시글 삭제
	public int deleteNotifyBoard(String no);

	// 해당 글
	public Board searchNotifyBoard(String no);

	// 조건에 맞는 글 모두 검색
	public List<Board> searchNotifyall(PageBean bean);

	// 게시글 개수검색
	public int count();
}
