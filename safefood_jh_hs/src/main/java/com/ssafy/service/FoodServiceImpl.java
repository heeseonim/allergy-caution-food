package com.ssafy.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ssafy.fms.dao.FoodDao;
import com.ssafy.fms.dao.FoodDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;
import com.ssafy.vo.Nutrition;
import com.ssafy.vo.SafeFoodException;

public class FoodServiceImpl implements FoodService {
	private MyBatisUtil util = MyBatisUtil.getUtil();
	private FoodDao dao;
	private MyBatisUtil mutil = MyBatisUtil.getUtil();
	
	private static Logger logger = LoggerFactory.getLogger(FoodServiceImpl.class);
	private String[] allergys = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
			"계란흰자" };

	public FoodServiceImpl() {
		dao = FoodDaoImpl.getFoodDao();
	}

	public List<Food> searchAll(FoodPageBean bean) {
		return dao.searchAll(mutil.getSession(),bean);
	}

	public Food search(int code) {
		// code에 맞는 식품 정보를 검색하고, 검색된 식품의 원재료에 알레르기 성분이 있는지 확인하여 Food 정보에 입력한다.
		Food food = dao.search(mutil.getSession(),code);
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
		return dao.searchBest(mutil.getSession());
	}

	public List<Food> searchBestIndex() {
		return dao.searchBestIndex(mutil.getSession());
	}

	@Override
	public void insertData(Food food) {
		SqlSession session = mutil.getSession();
		try {
			int insertResult = dao.insertFood(session, food);
			logger.trace(insertResult + "개 저장");
			session.commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			session.close();
		}

	}

	public Nutrition searchNut(int code) throws SQLException {
		return null;
	}

	@Override
	public void addeat(int code, int amount) {
		
	}
}
