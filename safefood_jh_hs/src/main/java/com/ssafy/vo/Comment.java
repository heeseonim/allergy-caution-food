package com.ssafy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class Comment {
	private int no;
	private int commentno;
	private String id;
	private String contents;

	public Comment(int no, String id, String contents) {
		this.no = no;
		this.id = id;
		this.contents = contents;
	}
}
