package com.ssafy.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Nutrition {
	private int number;
	private String name;
	private int amount;
	private Date date;

	
	
}
