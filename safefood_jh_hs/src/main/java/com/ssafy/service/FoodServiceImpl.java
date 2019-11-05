package com.ssafy.service;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.FoodDao;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;
import com.ssafy.vo.Nutrition;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodDao dao;

	private static Logger logger = LoggerFactory.getLogger(FoodServiceImpl.class);
	private String[] allergys = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
			"계란흰자" };

	public List<Food> searchAll(FoodPageBean bean) {
		return dao.searchAll(bean);
	}

	public Food search(int code) {
		// code에 맞는 식품 정보를 검색하고, 검색된 식품의 원재료에 알레르기 성분이 있는지 확인하여 Food 정보에 입력한다.
		Food food = dao.search(code);
		StringBuilder sb = new StringBuilder("");
		for (String allergy : allergys) {
			if (allergy != null && food.getMaterial().contains(allergy)) {
				sb.append(allergy + " ");
			}
		}
		food.setAllergy(sb.toString());

		return food;
	}

	public List<Food> searchBest() {
		return dao.searchBest();
	}

	public List<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}

	@Override
	public int insertData(Food food) {
		return dao.insertFood(food);
	}

	public Nutrition searchNut(int code) throws SQLException {
		return null;
	}

	@Override
	public void addeat(int code, int amount) {

	}

	@Override
	public List<Food> searchAll() {
		return dao.searchAll();
	}

	@Override
	public int foodCount(FoodPageBean bean) {
		return dao.foodCount(bean);
	}

	@Override
	public Food searchName(String name) {
		return dao.searchName(name);
	}

	@Override
	public List<Food> getAllList() {
		return dao.getAllList();
	}

	@Override
	public int insertFood(Food food) {
		return dao.insertFood(food);
	}

	@Override
	public int updateClick(Food food) {
		return dao.updateClick(food);
	}
}
