package com.sh.qna.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.qna.domain.QnaDTO;

@Repository
public class QnaRepositoryImp implements QnaRepositoryI{
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.sh.QnaMapper";

	
	// 현재페이지에 대한 목록 가져오기
	// 입력 : int page, int pageSize (현재페이지번호, 페이지사이즈크기)
	// 반환 : ArrayList<QnaDTO>      (고객목록)
	
	@Override
	public List<QnaDTO> getListPage(int currentPage , int pageSize){
		
		//  시작페이지			마지막 페이지
		int startPage = 0, endPage = 0;
		startPage = ((currentPage-1)*pageSize)+1;
		endPage = currentPage * pageSize;
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return session.selectList(namespace + ".getListPage", map);
	}
	
	@Override
	public QnaDTO getListOne(String q_code){

		return session.selectOne(namespace + ".getListOne" , q_code);
	}
	
	@Override
	public int getTotalCount() {
		return session.selectOne(namespace + ".getTotalCount");
	}
	
	@Override
	public void insertQna(QnaDTO dto){
		session.selectOne(namespace + ".insert", dto);
	}
	
	@Override
	public int updateQna(QnaDTO dto) {
		return session.update(namespace + ".update",dto );
		
	}
	
	@Override
	public int deleteQna(String code){
		return session.delete(namespace + ".delete" , code);

	}
	
	
	
	
	
	

}
