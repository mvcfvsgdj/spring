package page;

public class PageHandler1 {
	int currentPage; //현재페이지
	int totRecords; //총레코드수
	int pageSize;	//페이지 사이즈
	int grpSize; // 그룹의 사이즈
	
	int totalPage;
	int currentGrp;
	int grpStartPage;
	int grpEndPage;
	
	
	public PageHandler1(int currentPage, int totRecords, int pageSize, int grpSize) {
		super();
		this.currentPage = currentPage;
		this.totRecords = totRecords;
		this.pageSize = pageSize;
		this.grpSize = grpSize;
		calcPage();
	}
	
	private void calcPage() {
	
		// 1. 총페이지수
		// 2. 현재그룹
		// 3. 현재그룹시작페이지
		// 4. 현재그룹의 마지막페이지
		
		// 1. 총페이지수
		int remain = totRecords % pageSize;
		if(remain ==0) {
			totalPage =totRecords/pageSize;
		}else {
			totalPage = totRecords/pageSize +1;
			
		}
		int remain2 = currentPage % grpSize;
		if(remain2 ==0) {
			currentGrp = currentPage / grpSize;
			
		}else {
			currentGrp = currentPage / grpSize +1;
		}
		//현재 그룹 시작페이지 마지막페이지구하기
		grpStartPage = (currentGrp -1 ) * grpSize +1;
		grpEndPage = currentGrp*grpSize;
		
		if(grpEndPage > totalPage) {
			grpEndPage =totalPage;
		}
		
		
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotRecords() {
		return totRecords;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getGrpSize() {
		return grpSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getCurrentGrp() {
		return currentGrp;
	}

	public int getGrpStartPage() {
		return grpStartPage;
	}

	public int getGrpEndPage() {
		return grpEndPage;
	}
	
	public static void main(String[] args) {
		PageHandler1 h = new PageHandler1(6, 33, 4, 5);
		h.getTotalPage(); //9
		h.getCurrentGrp(); //2
		h.getGrpStartPage();//6
		h.getGrpEndPage();//9
	System.out.println(h.getTotalPage());
	System.out.println(h.getCurrentGrp());
	System.out.println(h.getGrpStartPage());
	System.out.println(h.getGrpEndPage());
	}
}
