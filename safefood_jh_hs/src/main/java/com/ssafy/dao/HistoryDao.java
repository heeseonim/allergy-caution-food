package com.ssafy.dao;

import java.util.List;

import com.ssafy.vo.History;

public interface HistoryDao {
	public List<History> selectHistory(String id);
	public int insertHistory(History history);
}
