package com.ssafy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String[] allergy;
}
