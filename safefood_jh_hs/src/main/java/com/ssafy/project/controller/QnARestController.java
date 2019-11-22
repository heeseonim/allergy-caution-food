package com.ssafy.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.service.QnABoardService;
import com.ssafy.vo.Board;
import com.ssafy.vo.PageBean;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@CrossOrigin({"*"})
public class QnARestController {
	@Autowired
	QnABoardService bs;

	@GetMapping("/QnABoard")
	@ApiOperation("전체 QnABoard리스트")
	public ResponseEntity<Map<String,Object>> showListBoard() {
		PageBean bean = new PageBean("all", null, null);
		try {
			// 	model.addAttribute("listboard", bs.searchAll(bean));
			//	session.setAttribute("pagenow", "notice");
			return response(bs.searchQnAall(bean),HttpStatus.OK,true);
		} catch (RuntimeException e) {
//		 	model.addAttribute("listboard", bs.searchAll(bean));
				//	session.setAttribute("pagenow", "notice");
			return response("Get Board Error",HttpStatus.CONFLICT,true);
		}
		
	}

	//QnA해당 게시글 상세정보
	@GetMapping("/QnABoard/{no}")
	@ApiOperation("해당번호 QnABoard의 상세 정보")
	public ResponseEntity<Map<String,Object>> showDetailBoard(@PathVariable String no) {
		//model.addAttribute("detailboard", bs.search(no));
		try {		
			return response(bs.searchQnABoard(no),HttpStatus.OK,true);
		} catch (RuntimeException e) {
			return response("Get BoardDetail Error",HttpStatus.CONFLICT,true);
		}
	}


	// 글쓰기 DB처리
	@PostMapping("/QnABoard")
	public ResponseEntity<Map<String,Object>> InsertBoard(@RequestBody Board board) {
	//	String loginuser = (String) session.getAttribute("login");
  String loginuser="tempUser";//일단 임시값 넣어놓고 나중에 session값 처리 가능하면 그때 session처리
		Board temp = new Board(loginuser, board.getTitle(), board.getContents());

		try {
			return response(bs.insertQnABoard(board),HttpStatus.OK,true);
			//int result = bs.insertBoard(temp);
		} catch (RuntimeException e) {
			log.trace("Board insert error : {}", e);
			throw e;
		}
	}

	// 총 게시판 갯수
	@GetMapping("/QnAcount")
	public ResponseEntity<Map<String,Object>> showSearchBoard() {
		return response(bs.count(),HttpStatus.OK,true);
	}

	// 글 수정 동작
	@PutMapping("/QnABoard")
	public ResponseEntity<Map<String,Object>> UpdateBoard(@RequestBody Board board) {
		try {
			return response(bs.updateQnABoard(board),HttpStatus.OK,true);
		} catch (RuntimeException e) {
			log.trace("Board update error : {}", e);
			throw e;
		}
	}

	// 글 삭제 동작
	@DeleteMapping("/QnABoard/{no}")
	public ResponseEntity<Map<String,Object>> DeleteBoard(@PathVariable String no) {
		try {
			return response(bs.deleteQnABoard(no),HttpStatus.OK,true);
		} catch (RuntimeException e) {
			log.trace("Board delete error : {}", e);
			throw e;
		}
	}

	//
	@ResponseBody
	@ApiOperation("pagination시 가져올 QnABoard데이터들 아직 pagination이 구현되지 않았으므로 사용안함")
	@GetMapping("/listQnABoardData") //pagenation시 가져올 QnAboard데이터들
	public List<Board> listBoardData(@RequestParam String key, @RequestParam String word,
			@RequestParam String pageNumber) {
		PageBean bean = new PageBean(key, word, pageNumber);
		List<Board> result = bs.searchQnAall(bean);
		return result;
	}
	
	private ResponseEntity<Map<String, Object>> response(Object data, HttpStatus httpStatus, boolean status){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("data",data);
		resultMap.put("status",status);
		
		
		//상태와 함께 Map반환
		return new ResponseEntity<>(resultMap,httpStatus);
	}
}