package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.JJim;


public interface JJimDao {

	public int insertJJim(JJim jjim);

	public List<JJim> searchJJimById(String id);

	public int deleteJJim(JJim jjim);
	
	public JJim findJJim(JJim jjim);
}
