<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

 
 <c:set var="path"  value="<%=request.getContextPath() %>"/>
 
 <c:forEach  var="item" items="${list1}">
	 <tr>
	<td>${item.m_id }</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	</tr>
 </c:forEach> 
 
 </table>
  
  
 
  
 	///////////////// 
 <c:set var="index" value="${handler.grpStartPage}" />
 

<c:if test="${handler.currentGrp > 1}">
    <a href="/pagePrj0911/list3.page?p=${index - 1}">[ 이전 ]</a>
</c:if>


<c:forEach begin="${index}" end="${handler.grpEndPage}" var="i"> 
    <a href="/pagePrj0911/list3.page?p=${i}">[ ${i} ]</a>  
</c:forEach>


 

<c:if test="${handler.grpEndPage <  handler.totalPage}">
    <a href="/pagePrj0911/list3.page?p=${handler.grpEndPage+1}">[ 다음 ]</a>
</c:if>
 	 

 
	
</body>
</html>