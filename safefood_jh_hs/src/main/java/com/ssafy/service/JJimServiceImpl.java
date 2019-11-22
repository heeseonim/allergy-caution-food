package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.JJimDao;
import com.ssafy.vo.JJim;
@Service
public class JJimServiceImpl implements JJimService {
	@Autowired
	JJimDao dao;
	
	@Override
	public int insertJJim(JJim jjim) {
		return dao.insertJJim(jjim);
	}

	@Override
	public List<JJim> searchJJimById(String id) {
		return dao.searchJJimById(id);
	}

	@Override
	public int deleteJJim(JJim jjim) {
		return dao.deleteJJim(jjim);
	}

	@Override
	public JJim findJJim(JJim jjim) {
		return dao.findJJim(jjim);
	}

}
