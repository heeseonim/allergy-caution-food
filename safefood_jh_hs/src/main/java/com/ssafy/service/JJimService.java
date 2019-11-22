package com.ssafy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.vo.Board;
import com.ssafy.vo.JJim;
import com.ssafy.vo.PageBean;


public interface JJimService {
	
	public int insertJJim(JJim jjim);

	public List<JJim> searchJJimById(String id);

	public int deleteJJim(JJim jjim);
	
	public JJim findJJim(JJim jjim);

}
