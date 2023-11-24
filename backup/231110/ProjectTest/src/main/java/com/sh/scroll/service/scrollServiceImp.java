package com.sh.scroll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.scroll.domain.ScrollDTO;
import com.sh.scroll.repository.scrollRepositoryI;

@Service
public class scrollServiceImp implements scrollServiceI {

	@Autowired
	scrollRepositoryI dao;

	@Override
	public int getTotalCnt() {
		return dao.totalCnt();
	}

	@Override
	public List<ScrollDTO> getListScroll(int curpage, int pageSize) {
		return dao.getScroll(curpage, pageSize);
	}
}
