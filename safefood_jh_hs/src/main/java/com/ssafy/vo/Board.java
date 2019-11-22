package com.ssafy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class Board {
	private int no;
	private String id;
	private String title;
	private String regdate;
	private String contents;

	public Board(int no, String title, String contents) {
		this.no = no;
		this.title = title;
		this.contents = contents;
	}
	
	public Board(String id, String title, String contents) {
		this.id = id;
		this.title = title;
		this.contents = contents;
	}

	public Board(int no, String id, String title, String regdate) {
		this.no = no;
		this.id = id;
		this.title = title;
		this.regdate = regdate;
	}
}
