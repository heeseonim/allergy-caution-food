package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.util.FoodNutritionSAXHandler;
import com.ssafy.util.FoodSAXHandler;
import com.ssafy.util.FoodSaxParser;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;
import com.ssafy.vo.Member;
import com.ssafy.vo.SafeFoodException;

public class FoodDaoImpl implements FoodDao {
	
	private static Logger logger = LoggerFactory.getLogger(FoodDaoImpl.class);
	private List<Food> foods;
	private static FoodDao dao = new FoodDaoImpl();
	public static FoodDao getFoodDao() {
		return dao;
	}
	private final String namespace="com.ssafy.mapper.FoodMapper.";
	
	private FoodDaoImpl() {
//		loadData();
		System.out.println("데이터 로딩중");
	}

	public void loadData() {
		// 코드에 맞는 식품 클릭 수 저장
		
	}
	
	@Override
	public int insertFood(SqlSession session, Food food){
		String stmt = namespace+"insertFood";
		return session.insert(stmt, food);
	}	
	
	public int addFood(SqlSession session, Food food) {
		String stmt = namespace+"addFood";
		return session.insert(stmt, food);
	}
	public int foodCount(SqlSession session, FoodPageBean bean) {
		// 구현하세요.
		int result = -1;
		String stmt = namespace+"foodCount";
		if (bean.getKey() == "all") {
		} else if (bean.getKey() == "name") {
			stmt+="Name";
		} else if (bean.getKey() == "maker") {
			stmt+="Maker";
		} else if (bean.getKey() == "material") {
			stmt+="Material";
		}
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("word", bean.getWord());
		
		logger.trace("foodCount " + namespace);
		
		result = session.selectOne(stmt,map);
		return result;
	}
	
	public List<Food> searchAll(SqlSession session, FoodPageBean bean) {
		List<Food> finds = new LinkedList<Food>();
		String stmt = namespace+"searchAllBean";
		
		String word = "all";
		
		if(bean != null) {
			String key = bean.getKey();
			word = (bean.getWord() != null && !bean.getWord().trim().equals(""))? bean.getWord() : "";
			if (key.equals("all")) {
			} else if (key.equals("name")) {
				stmt+="Name";
			} else if (key.equals("maker")) {
				stmt+="Maker";
			} else if (key.equals("material")) {
				stmt+="Material";
			}
		}
			
		finds = session.selectList(stmt, word);
		return finds;
	}

	public List<Food> searchAll(SqlSession session) {
		List<Food> finds = new LinkedList<>();
		String stmt = namespace+"searchAll";		
		
		finds = session.selectList(stmt);
		
		return finds;
	}	
	
	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환.
	 * 
	 * @param code 검색할 식품 코드
	 * @return 식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 */
	public Food search(SqlSession session, int code) {
		// 코드에 맞는 식품 검색하여 리턴
		//String sql = "select * from food where code = ?";
		String stmt = namespace+"searchCode";
		
		return session.selectOne(stmt, code);
	}
	
	public Food searchName(SqlSession session, String name) {
		String stmt = namespace+"searchName";
		return session.selectOne(stmt, name);
	}
	@Override
	public int updateClick(SqlSession session, Food food){
//		String sql = "update food set frequency = ? where code = ?";
//		String stmt = namespace+"updateClick";
		return 1;
	}	

	
	public void updateClick(SqlSession session, int code) {
		// 클릭시마다 클릭 + 1
		String stmt = namespace + "updateClick";
		session.selectOne(stmt, code);
	}

	
	/**
	 * 가장 많이 검색한 Food 정보 리턴하기 web에서 구현할 내용.
	 * 
	 * @return
	 */
	public List<Food> searchBest(SqlSession session) {
		return null;
	}

	public List<Food> searchBestIndex(SqlSession session) {
		return null;
	}

	public List<Food> getAllList(SqlSession session) {
		return foods;
	}
	
	
	public static void main(String[] args) {
	}

	public static void print(List<Food> foods) {
		for (Food food : foods) {
			System.out.println(food);
		}
	}
	
}
