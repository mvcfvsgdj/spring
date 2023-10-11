<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="page.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="page.MemberDao" %>
<!DOCTYPE html>
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

<% ArrayList<Member>  list =  (ArrayList<Member>)request.getAttribute("list1") ;  
for( Member m: list) {
%>

<tr>
<td> <%=m.getM_id() %></td>
<td> <%=m.getM_name() %></td>
<td> <%=m.getM_pw() %></td>
<td> <%=m.getM_birthday() %></td>
<td> <%=m.getM_tel() %></td>
<td> <%=m.getM_point() %></td>
<td> <%=m.getM_grade() %></td>
</tr>

<%} %>
</table>
<%
	int currentPage=1;
	if( request.getAttribute("p") != null){
		 currentPage  =(Integer) request.getAttribute("p");		 
	} 
     
	 int totRecords = 0; // 총 레코드 수 
	 totRecords  =  (Integer)request.getAttribute("totCnt");
	 int pageSize =2;    //페이지 사이즈  (데이터 건수 , 한 페이징 보이는 레코드 수 )	 	 
	 int totalPage;             // 총 페이지수: 전체 페이수   	 
	 int grpSize=5;             // 한 그룹에 5깨씩 보겟다
	 int currentGrp =0;  	    // 현재그룹
	// int currentPage =1;
	 	 
	 
	 int reamin = totRecords  %  pageSize ;		 
	 //총 페이지수 구하기
	 if( reamin ==0 )
		 totalPage = totRecords / pageSize;
		 
	 else 
		 totalPage = totRecords / pageSize +1;
	    
	  
	 
	 // 현재그룹 구하기
	 // 현재그룹의 시작번호
	 // 현재그룹의 끝번호
	 int remain2 = currentPage % grpSize;    // 7 => 그룹2  ,  시작 6 , 끝 10
	 
	 
	 if( remain2 ==0 )
		 currentGrp  = currentPage  / grpSize ;     //  10 /5 =>2  , 2번째 그룹 
		 
	 else 
		 currentGrp = currentPage  / grpSize  +1;   //  4 /5 + 1 => 1번째 그룹 ,  7 /5 => 1 +1 => 2그룹 
	 
		 
	 int grpStartPage = ( currentGrp -1 ) * grpSize +1 ;  // 그룹의 시작번호   현재그룹 1 => 1  , 현재그룹 2 -> 6
	 int grpEndPage = currentGrp * grpSize;               // 그룹의 끝번호    1-> 5  , 2-> 10
	 
	 
	 if( grpEndPage > totalPage){
		 grpEndPage = totalPage;    // 그룹의 끝번호   10 -> 9로 변경 , 그룹의 끝번호가 마지막페이지번호 크다면
	 }
	 
	 
	 
	 
	 int index = grpStartPage;	 
	 if( currentGrp >1){	%>
		 
	     <a href="/pagePrj0911/list.page?p=<%=index-1%>">[ 이전 ]</a>  
	    
	 <%   
	 } 
	 
	 
	 while( index <= grpEndPage){		 
	 %>
		  <a href="/pagePrj0911/list.page?p=<%=index%>">[  <%=index %> ]</a> 
        <%
		  index ++;
        
	 }
	 
	 if( grpEndPage  <   totalPage  ){
	 
	 %>
	
		   <a href="/pagePrj0911/list.page?p=<%=grpEndPage+1%>">[ 다음 ]</a>  
	<% }
	%>
	
</body>
</html>