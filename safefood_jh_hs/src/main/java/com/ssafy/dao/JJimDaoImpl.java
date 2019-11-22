package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.vo.JJim;
@Repository
public class JJimDaoImpl implements JJimDao {
	@Autowired
	SqlSession session;
	
	private final String namespace = "com.ssafy.mapper.JJimMapper.";
	
	@Override
	public int insertJJim(JJim jjim) {
		return session.insert(namespace+"insertJJim", jjim);
	}

	@Override
	public List<JJim> searchJJimById(String id) {
		return session.selectList(namespace+"searchJJimById", id);
	}

	@Override
	public int deleteJJim(JJim jjim) {
		return session.delete(namespace+"deleteJJim", jjim);
	}

	@Override
	public JJim findJJim(JJim jjim) {
		return session.selectOne(namespace+"findJJim", jjim);
	}

}
