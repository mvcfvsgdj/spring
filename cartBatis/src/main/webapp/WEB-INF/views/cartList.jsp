<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 function order() {
	let frm = document.frm;
	let goods_Qty  =   document.frm.goods_Qty;
	let goods_no  = document.frm.goodsNo;
	let h_orderItem  = document.frm.h_orderItem;  //선택한 상품에 대해 상품코드와 수량을 저장할 hidden값
	
	
	
	let ck = document.frm.ck;  // 체크태그 얻어오기
	
	alert( h_orderItem.length);
	
	for( let i =0; i< ck.length ;i ++){
		if( ck[i].checked== true){   // 선택한 상품정보만 hidden 상품코드:수량 형식으로 저장한다 
			                          
			h_orderItem[i].value=  goods_no[i].value+":" +  goods_Qty[i].value;
			
		}
	}
	
	frm.submit();
 }

</script>

</head>
<body>


 
<c:set var="goodsList" value="${cartMap.goodsList}"/>
<c:set var="cartList" value="${cartMap.cartList}"/>


<h2>장바구니 리스트</h2>
<form name="frm"  action="/cart/order"  method="post">
<table>

<c:forEach var="item"  items="${cartMap.goodsList}" varStatus="cnt">
<c:set var="cartQty" value="${cartList[cnt.count-1].cartQty}"></c:set>

<tr>
<td>선택  <input type="checkbox" name="ck" checked></td>
<td>상품코드 :<input type="text"  name="goodsNo" value="${item.goodsNo}"></td>
<td>상품명: ${item.name}</td>
<td> 수량:
 <input type="text" name="goods_Qty" value="${cartQty}">
 <!--  hidden 태그  장바구니번호: 삭제, 변경할 때 사용 
 h_orderItem은 선택한 상품의 상품번호와: 수량을 담아서 서버로 보냄
 -->
 <input type="hidden" name="h_orderItem">
 장바구니번호:<input type="hidden"  name="h_cartNo" value= "${cartList[cnt.count-1].cartNO}"></td>
 
</tr>
</c:forEach>
 <tr>
 <td> <button  type="button" onclick="order()">주문하기</button></td>
 </tr>
 
</table>
</form>

</body>
</html>