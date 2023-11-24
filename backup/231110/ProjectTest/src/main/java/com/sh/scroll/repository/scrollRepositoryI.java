package com.sh.scroll.repository;

import java.util.List;

import com.sh.scroll.domain.ScrollDTO;

public interface scrollRepositoryI {
	public int totalCnt();

	public List<ScrollDTO> getScroll(int curpage, int pageSize);
}
