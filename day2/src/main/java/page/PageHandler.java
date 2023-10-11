package page;

public class PageHandler {
  
    int currentPage;  // 현재페이지
    int totRecords;   // 전체 레코드 수
    int pageSize;     // 페이지당 레코드 수
    int grpSize;      // 그룹당 페이지 수


    int totalPage;     // 총 페이지 수
    int currentgrp;    // 현재 그룹
    int grpStartPage;  // 그룹의 시작 페이지
    int grpEndPage;    // 그룹의 끝 페이지

    public PageHandler(int currentPage, int totRecords, int pageSize, int grpSize) {
        super();
        this.currentPage = currentPage;
        this.totRecords = totRecords;
        this.pageSize = pageSize;
        this.grpSize = grpSize;
        calPage();
    }

    private void calPage() {
        // 총 페이지 수 계산
        int remain = totRecords % pageSize;
        if (remain == 0) {
            totalPage = totRecords / pageSize;
        } else {
            totalPage = totRecords / pageSize + 1;
        }

        // 나머지를현재 그룹 계산
        int remain2 = currentPage % grpSize;
        if (remain2 == 0) {
            currentgrp = currentPage / grpSize;
        } else {
            currentgrp = currentPage / grpSize + 1;
        }

        // 현재 그룹의 시작 페이지와 끝 페이지 계산
        grpStartPage = (currentgrp - 1) * grpSize + 1;
        grpEndPage = currentgrp * grpSize;

        // 그룹의 끝 페이지가 총 페이지 수를 초과하는 경우 수정
        if (grpEndPage > totalPage) {
            grpEndPage = totalPage;
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

    public int getCurrentgrp() {
        return currentgrp;
    }

    public int getGrpStartPage() {
        return grpStartPage;
    }

    public int getGrpEndPage() {
        return grpEndPage;
    }

    public static void main(String[] args) {
        PageHandler h = new PageHandler(1, 15, 5, 3);
        System.out.println(h.getTotalPage());
        System.out.println(h.getCurrentgrp());
        System.out.println(h.getGrpStartPage());
        System.out.println(h.getGrpEndPage());
    }
}