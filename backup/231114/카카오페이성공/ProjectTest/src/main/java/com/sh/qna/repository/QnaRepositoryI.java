package com.sh.qna.repository;

import java.util.List;

import com.sh.qna.domain.QnaDTO;


public interface QnaRepositoryI {
	
	public List<QnaDTO> getListPage(int currentPage , int pageSize);
	public int getTotalCount();
	public void insertQna(QnaDTO dto);
	public int updateQna(QnaDTO dto);
	public int deleteQna(String code);
	public QnaDTO getListOne(String code);
	
}
