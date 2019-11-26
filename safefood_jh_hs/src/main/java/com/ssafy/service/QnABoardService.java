package com.ssafy.service;

import java.util.List;


import com.ssafy.vo.Board;
import com.ssafy.vo.Comment;
import com.ssafy.vo.PageBean;

public interface QnABoardService {

	// 게시글 추가
	public int insertQnABoard(Board board);

	// 게시글 업데이트
	public int updateQnABoard(Board board);

	// 게시글 삭제
	public int deleteQnABoard(String no);

	// 해당 글
	public Board searchQnABoard(String no);

	// 조건에 맞는 글 모두 검색
	public List<Board> searchQnAall(PageBean bean);

	// 게시글 개수검색
	public int count();

	public List<Comment> commentlistByno(int no);

	public int commentinsert(Comment comment);

	public int commentdelete(int commentno);

}
