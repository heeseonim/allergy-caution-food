package com.ssafy.service;

import java.util.List;

import com.ssafy.vo.History;

public interface HistoryService {
	public List<History> selectHistory(String id);
	public int insertHistory(History history);
}
