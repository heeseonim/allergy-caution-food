package com.ssafy.dao;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

@Repository
public class FoodDaoImpl implements FoodDao {

	@Autowired
	SqlSession session;

	private List<Food> foods;

	private final String namespace = "com.ssafy.mapper.FoodMapper.";

	public void loadData() {
		// 코드에 맞는 식품 클릭 수 저장
	}

	@Override
	public int insertFood(Food food) {
		return session.insert(namespace + "insertFood", food);
	}

	public int addFood(Food food) {
		return session.insert(namespace + "addFood", food);
	}

	public int foodCount(FoodPageBean bean) {
		// 구현하세요.
		int result = -1;
		String stmt = namespace + "foodCount";
		if (bean.getKey() == "all") {
		} else if (bean.getKey() == "name") {
			stmt += "Name";
		} else if (bean.getKey() == "maker") {
			stmt += "Maker";
		} else if (bean.getKey() == "material") {
			stmt += "Material";
		}
		Map<String, String> map = new HashMap<String, String>();

		map.put("word", bean.getWord());

		result = session.selectOne(stmt, map);
		return result;
	}

	public List<Food> searchAll(FoodPageBean bean) {
		List<Food> finds = new LinkedList<Food>();
		String stmt = namespace + "searchAllBean";

		String word = "all";
		
		if (bean != null) {
			String key = bean.getKey();
			System.out.println(key);
			word = (bean.getWord() != null && !bean.getWord().trim().equals("")) ? bean.getWord() : "";
			if (key.equals("all")) {
			} else if (key.equals("name")) {
				stmt += "Name";
			} else if (key.equals("maker")) {
				stmt += "Maker";
			} else if (key.equals("material")) {
				stmt += "Material";
			}
		}

		finds = session.selectList(stmt, word);
		return finds;
	}

	public List<Food> searchAll() {
		return session.selectList(namespace + "searchAll");
	}

	public Food search(int code) {
		// 코드에 맞는 식품 검색하여 리턴
		return session.selectOne(namespace + "searchCode", code);
	}

	public Food searchName(String name) {
		return session.selectOne(namespace + "searchName", name);
	}

//	@Override
//	public int updateClick(Food food) {
////		String sql = "update food set frequency = ? where code = ?";
////		String stmt = namespace+"updateClick";
//		return 1;
//	}

	public int updateClick(Food food) {
		// 클릭시마다 클릭 + 1
		return session.update(namespace + "updateClick", food);
	}

	/**
	 * 가장 많이 검색한 Food 정보 리턴하기 web에서 구현할 내용.
	 * 
	 * @return
	 */
	public List<Food> searchBest() {
		return null;
	}

	public List<Food> searchBestIndex() {
		return null;
	}

	public List<Food> getAllList() {
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
