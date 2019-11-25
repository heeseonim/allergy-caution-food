package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.HistoryDao;
import com.ssafy.vo.History;

@Service
public class HistoryServiceImpl implements HistoryService {

	@Autowired
	HistoryDao hdao;
	
	@Override
	public List<History> selectHistory(String id) {
		return hdao.selectHistory(id);
	}

	@Override
	public int insertHistory(History history) {
		return hdao.insertHistory(history);
	}

}
