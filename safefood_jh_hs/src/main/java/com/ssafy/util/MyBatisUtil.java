package com.ssafy.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	// singleton
	private static MyBatisUtil util = new MyBatisUtil();
	public static MyBatisUtil getUtil() {
		return util;
	}
	private MyBatisUtil() {
		String resource = "mybatis/mybatis-config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// SqlSession을 만들기 위한 객체
	SqlSessionFactory sqlSessionFactory;
	// 실제 쿼리를 실행하기 위한 객체
	public SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}
	
}