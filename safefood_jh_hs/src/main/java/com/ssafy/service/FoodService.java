package com.ssafy.service;

import java.util.List;

import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public interface FoodService {
	
	public int insertData(Food food);
	public int foodCount(FoodPageBean bean);
	public List<Food> searchAll();
	public List<Food> searchAll(FoodPageBean bean);
	public Food search(int code);
	public Food searchName(String name);
	public List<Food> searchBest();
	public List<Food> searchBestIndex();
	public List<Food> getAllList();
	public void addeat(int code, int amount);
	public int insertFood(Food food);
	public int updateClick(Food food);
	public List<Food> searchByFrequency();
}
