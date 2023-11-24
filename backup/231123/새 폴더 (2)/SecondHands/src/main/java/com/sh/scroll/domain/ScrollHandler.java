package com.sh.scroll.domain;

public class ScrollHandler {
	int currentPage; //현재 페이지
	int totRecords; //총 레코드 수
	int pageSize; //페이지 사이즈(한페이지에 보이는 글의 수 )
	
	int totalPage;
	
	public ScrollHandler(int currentPage, int totRecords, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.totRecords = totRecords;
		this.pageSize = pageSize;
		this.totalPage = (totRecords/pageSize)+1;
	}
	
	public ScrollHandler() {
	}
	
	

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotRecords() {
		return totRecords;
	}

	public void setTotRecords(int totRecords) {
		this.totRecords = totRecords;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	@Override
	public String toString() {
		return "PageHandler2 [currentPage=" + currentPage + ", totRecords=" + totRecords + ", pageSize=" + pageSize
				+ ", totalPage=" + totalPage + "]";
	}
}
