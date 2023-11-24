package com.sh.scroll.service;

import java.util.List;

import com.sh.scroll.domain.ScrollDTO;

public interface scrollServiceI {
	public int getTotalCnt();

	public List<ScrollDTO> getListScroll(int curpage, int pageSize);
}
