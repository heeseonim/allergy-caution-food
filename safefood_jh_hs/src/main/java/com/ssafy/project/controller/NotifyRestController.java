package com.ssafy.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.ssafy.service.NotifyBoardService;
import com.ssafy.vo.Board;
import com.ssafy.vo.Comment;
import com.ssafy.vo.Member;
import com.ssafy.vo.PageBean;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@CrossOrigin({ "*" })
public class NotifyRestController {
	
	@Autowired
	NotifyBoardService bs;

	@GetMapping("/NotifyBoard")
	@ApiOperation("전체 NotifyBoard리스트")
	public ResponseEntity<Map<String, Object>> showNotifyBoard() {
		PageBean bean = new PageBean("all", null, null);
		try {
			return response(bs.searchNotifyall(bean), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			return response("Get Board Error", HttpStatus.CONFLICT, true);
		}

	}

	// QnA해당 게시글 상세정보
	@GetMapping("/NotifyBoard/{no}")
	@ApiOperation("해당번호 QnABoard의 상세 정보")
	public ResponseEntity<Map<String, Object>> showNotifyDetail(@PathVariable String no) {
		try {
			return response(bs.searchNotifyBoard(no), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			return response("Get BoardDetail Error", HttpStatus.CONFLICT, true);
		}
	}

	// 글쓰기 DB처리
	@PostMapping("/NotifyBoard")
	public ResponseEntity<Map<String, Object>> InsertNotify(@RequestBody Board board) {
		String loginuser = "tempUser";
		Board temp = new Board(loginuser, board.getTitle(), board.getContents());

		try {
			return response(bs.insertNotifyBoard(board), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			log.trace("Board insert error : {}", e);
			throw e;
		}
	}	

	// 글 수정 동작
	@PutMapping("/NotifyBoard")
	public ResponseEntity<Map<String, Object>> UpdateNotify(@RequestBody Board board) {
		try {
			return response(bs.updateNotifyBoard(board), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			log.trace("Board update error : {}", e);
			throw e;
		}
	}

	// 글 삭제 동작
	@DeleteMapping("/NotifyBoard/{no}")
	public ResponseEntity<Map<String, Object>> DeleteBoard(@PathVariable String no) {
		try {
			return response(bs.deleteNotifyBoard(no), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			log.trace("Board delete error : {}", e);
			throw e;
		}
	}

	//
	@ResponseBody
	@ApiOperation("pagination시 가져올 NotifyBoard데이터들 아직 pagination이 구현되지 않았으므로 사용안함")
	@GetMapping("/listNotifyBoardData")
	public List<Board> listBoardData(@RequestParam String key, @RequestParam String word,
			@RequestParam String pageNumber) {
		PageBean bean = new PageBean(key, word, pageNumber);
		List<Board> result = bs.searchNotifyall(bean);
		return result;
	}

	private ResponseEntity<Map<String, Object>> response(Object data, HttpStatus httpStatus, boolean status) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("data", data);
		resultMap.put("status", status);

		// 상태와 함께 Map반환
		return new ResponseEntity<>(resultMap, httpStatus);
	}
}
