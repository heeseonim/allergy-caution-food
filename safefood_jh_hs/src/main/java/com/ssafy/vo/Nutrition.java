package com.ssafy.vo;

import java.sql.Date;

public class Nutrition {
	private int number;
	private String name;
	private int amount;
	private Date date;
	
	public Nutrition() {}
	public Nutrition(int number, String name, int amount, Date date) {
		super();
		this.number = number;
		this.name = name;
		this.amount = amount;
		this.date = date;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Nutrition [number=" + number + ", name=" + name + ", amount=" + amount + ", date=" + date + "]";
	}
	
	
	
}
