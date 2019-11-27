package com.ssafy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String[] allergy;
	private String al;
	private String ans;
	public Member(String id, String pw, String name, String phone, String email, String al) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.al = al;
	}
}
