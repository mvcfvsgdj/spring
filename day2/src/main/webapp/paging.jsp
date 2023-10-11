<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
 

<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
 
</table>
<%
	 
	 int currentPage=1;   //현재페이지
	 if( request.getParameter("p") != null){
		 currentPage  = Integer.parseInt(request.getParameter("p"));			 
	 }
      
	 int totRecords =513;        //  총 레코드 수  , 임의 값 
	 int pageSize =7;            //페이지 사이즈  (데이터 건수 , 한 페이징 보이는 레코드 수, 목록 )
	 int grpSize=6;             // 한 그룹에 5깨씩 보겟다 
	 	 
	 
	 int totalPage;             // 총 페이지수: 전체 페이수    =>	 6페이지 (현재의 경우)	
	 int currentGrp =0;  	    // 현재그룹
	 
	 
	 /* 페이징 예시   ,한 그룹의 size =5
	     1그룹=>  [1] [2] [3] [4] [5] [다음]
	     2그룹 => [이전] [6]  [7]  [8]  [9]  [10] [다음]
	     3그룹 => [이전] [11] [12] [13] [14] [15] [다음]  
	     4그룹 => [이전] [16] [17] [18] [19]  	 
	    		 
	   */
	   
	 
	 //총 페이지수 구하기
	 int reamin = totRecords  %  pageSize ;	 	
	 if( reamin ==0 )
		 totalPage = totRecords / pageSize;		  // 총레코드 / 페이지사이즈    31 /4 =>
	 else 
		 totalPage = totRecords / pageSize +1;	  // 7+1  =>총 8페이지   
  
	 
	 /* 현재페이지에 따른 현재그룹 구하기 
	   1. 현재페이지가 1그룹인지 2그룹인지 현재그룹 구하기     예) 현재페이지 6=>  현재그룹 2    how) 현재페이지 / 그룹사이즈   5/5=>1그룹  ,  6/5 =>1+1 =>2그룹 ,  11/5=>2+1 =>3그룹
	   2. 현재그룹을 이용하여 그룹의 시작번호 구하기          예) 현재그룹의 시작번호 6
	   3. 현재그룹을 이용하여 그룹의 마지막번호 구하기         예) 현재그룹의 마지막번호 10
	 
	  현재그룹의 시작번호
	  현재그룹의 끝번호
	 */
	 int remain2 = currentPage % grpSize;               // 나머지에 따라 현재그룹이 달라짐 
	 if( remain2 ==0 )
		 currentGrp  = currentPage  / grpSize ;        //  5/5 =>1  그룹 ,  10 /5 =>2   그룹  ,  15/5 =>3그룹 
		 
	 else 
		 currentGrp = currentPage  / grpSize  +1;      //  4 /5 => + 1 => 1번째 그룹 ,  7 /5 => 1 +1 => 2그룹   , 12/5 => 2+1  =>3그룹
	 
		 
	 int grpStartPage = ( currentGrp -1 ) * grpSize +1 ;  // 그룹의 시작번호     
	 int grpEndPage = currentGrp * grpSize;               // 그룹의 끝번호    
	 
	 /*
	    현재그룹이 정해지면                                                                                         1일경우                2일경우                3일경우
	    현재그룹의 시작번호  =  (현재그룹 -1) * 그룹사이즈 +1            1   (1-1)*5 +1        6 (2-1)*5 +1           11 (3-1)*5+1
	    현재그룹의 마지막번호 =  현재그룹 *그룹사이즈                     5    1*5              10 2*5                  15  3*5
	 
	 */
	 
	 
	 if( grpEndPage > totalPage){
		 grpEndPage = totalPage;    // 그룹의 끝번호   10 -> 9로 변경 , 그룹의 끝번호가 마지막페이지번호 크다면
	 }
	 
	 
	 //그룹의 시작번호에서 그룹의 마지막번호까지 반복문으로 출력  , 반복제어변수: index  
	 // index변수는 그룹의 시작번호 설정된다 . !!!!!
	 
	 int index = grpStartPage;
	 
	 if( currentGrp >1){	
	%>
	     <a href="paging.jsp?p=<%=index-1%>">[이전 ]</a>  
	 <%}
	 
	 
	 while( index <= grpEndPage){		 
	 %>
		 <a href="/prj0911/paging.jsp?p=<%=index%>">[  <%=index %> ]</a> 
        <%
		  index ++;
        
	 }
	 
	 if( grpEndPage < totalPage){%>	
		  <a href="/prj0911/paging.jsp?p=<%=grpEndPage+1%>">[ 다음 ]</a>  
	<% }
	%>
	
</body>
</html>