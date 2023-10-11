<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="page.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");%>

<table>
<tr>
<td>아이디</td>
<td>비밀번호</td>
<td>이름</td>
<td>전화번호</td>
<td>생일</td>
<td>포인트</td>
<td>등급</td>
</tr>
</table>

	

<% for (Member m : list ){%>
<table>
	<tr>
	<td><%=m.getM_id()%></td>
	<td><%=m.getM_pw()%></td>
	<td><%=m.getM_name() %></td>
	<td><%=m.getM_tel() %></td>
	<td><%=m.getM_birthday() %></td>
	<td><%=m.getM_point() %></td>
	<td><%=m.getM_grade() %></td>
	</tr>
<% }%>
	</table>
	
	<%
	Integer totalCnt = (Integer) request.getAttribute("totalCnt");
	Integer pageSize = (Integer) request.getAttribute("pageSize");
	Integer p = (Integer) request.getAttribute("page");
	Integer grpSize = (Integer) request.getAttribute("grpSize");
	/*out.println(totalCnt);
	out.println(pageSize);
	out.println(p);
	out.print(grpSize); */
	int totalPage = 0;
	int currentGrp = 0;
	int grpStartPage = 0;
	int grpEndPage = 0;

	int remain = totalCnt % pageSize;
	if (remain == 0) {
		totalPage = totalCnt / pageSize;

	} else {
		totalPage = totalCnt / pageSize + 1;

	}

	//현재 그룹 구하기 , 현재페이지를 기준으로 구하기

	int remain2 = p % grpSize;
	if (remain2 == 0) {
		currentGrp = p / grpSize;

	} else {
		currentGrp = p / grpSize + 1;
	}

	//현재그룹 시작번호
	//현재그룹 마지막번호
	//현재그룹 1 - 1~5
	//현재그룹 2 - 6~10
	//현재그룹 3 - 11~15

	grpStartPage = (currentGrp - 1) * grpSize + 1;
	grpEndPage = currentGrp * grpSize;
	if (grpEndPage > totalPage) {
		grpEndPage = totalPage;
	}
	int index = grpStartPage;
	
	
	while (index < grpEndPage) {
		%><a href="/pagePrj0911/list2.page?p=<%=index%>">
		
		[ <%=index%> ]
		
	</a>
	<%
	//out.println(index);
	index++;
	}
	%>



</body>
</html>