<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>

<c:set var="path" value="${pageContext.request.contextPath}" />


<!--<c:set  var="path2"   value="<%=request.getContextPath() %>"/> -->


<!--${path} -->
<!--${path2}  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
* {
   box-sizing: border-box;
   /*outline: 1px solid gray;*/
}

body {
   margin: 0;
   padding: 0;
   font-family: 'Arial', sans-serif;
}

header {
   margin: 0 auto;
   background-color: #ff6f0f;
   padding: 10px;
   position: sticky;
   top: 0;
   color: white;
   z-index: 1000;
   text-align: center;
   display: flex;
   justify-content: space-between;
   align-items: center;
   width: 100%;
   height: 100px;
   box-sizing: border-box;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

header h2 {
   margin: 0;
   font-size: 24px;
}

.menu-icon {
   order: -1;
   font-size: 24px;
   cursor: pointer;
   margin-right: 20px;
}

header button {
   margin: 5px 5px; /* 간격을 줄이기 위해 margin 수정 */
   padding: 10px;
   background-color: #ff6f0f;
   font-weight: bold;
   color: white;
   border: none;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 20px;
   cursor: pointer;
   /* border-radius: 5px; 모서리 둥글게 */
   transition: background-color 0.3s, color 0.3s;
}

header button:hover {
   background-color: #ff6f0f;
   color: black;
}

header.menu-open {
   flex-direction: column;
   align-items: flex-start;
}

header.menu-open form {
   display: block;
}

header.menu-open h2 {
   margin-top: 10px;
}

.header-logo {
   display: flex;
}

.header-logo h2 {
   font-size: 32px;
}

.header-btn {
   display: flex;
   margin: 0px 0px 0px 500px;
}

header.menu-open {
   flex-direction: column;
   align-items: flex-start;
}

header.menu-open form {
   display: block;
}

header.menu-open h2 {
   margin-top: 10px;
}

.menu-icon:hover {
   color: black;
}

.menu-container {
   display: none;
   position: fixed;
   top: 100px;
   left: 0;
   width: 20%;
   height: 100%;
   background-color: #f9f9f9;
   z-index: 999;
   background-color: #f9f9f9;
}

.menu-container ul {
   list-style-type: none;
   padding: 0;
   margin: 0;
   text-align: center;
}

.menu-container li {
   padding: 15px;
   border-bottom: 1px solid #ddd;
}

.menu-container h2 {
   text-decoration: none;
   color: #333;
   font-weight: bold;
   font-size: 18px;
   transition: color 0.3s;
}

.menu-container button {
   color: black;
   background-color: #f9f9f9;
   font-weight: bold;
}

.menu-container Button:hover {
   background-color: #f9f9f9;
   color: #ff6f0f;
}

.menu-container h2:hover {
   color: #ff6f0f;
}

#sort {
    color: #cfcfcf;
   width: 749px;
   display: flex;
   align-items: center;
   margin: 0px auto;
   font-weight: bold;
}

#sort button {
   margin: 0px 6px 0px 6px;
   padding: 4px;
   font-weight: bold;
   background-color:white;
   color: black;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   transition: background-color 0.3s, color 0.3s;
}

#sort button:hover {
   color: #ff6f0f;;
}

.search {
   position: relative;
   width: 300px;
   margin-left: 230px;
}

.search input {
   width: 100%;
   border: 1px solid #bbb;
   border-radius: 8px;
   padding: 10px 12px;
   font-size: 14px;
   outline: none;
}

.search img {
   position: absolute;
   width: 17px;
   top: 10px;
   right: 12px;
   margin: 0;
}

.main-top {
   justify-content: center;
   align-items: center;
   padding: 20px;
}

#srSearch {
   margin-left: 13px;
}

.card_a {
   text-decoration: none;
   color: black;
   font-weight: bold;
   overflow: hidden;
   white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
   text-overflow: ellipsis;
}

.scrollWrap {
   width: 749px;
   margin: 0 auto;
   margin-top: 40px;
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   gap: 40px;
}

.card_wrap {
   background-color: white;
   width: 223px;
   height: 340px;
}

.card_image {
border-radius: 12px;
   height: 223px;
   background-size: cover;
}

.card_title {
   font-size: 14px;
   font-weight: normal;
   margin-bottom: 2px;
   overflow: hidden;
   white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
   text-overflow: ellipsis;
}

.card_date {
   font-size: 11px;
   color: gray;
   margin-bottom: 4px;
}

.card_price {
   font-size: 15px;
   font-weight: bold;
   margin-bottom: 2px;
}

.card_address {
   font-size: 12px;
}

.card_count {
   font-size: 12px;
   color: gray;
   display: flex;
   justify-content: space-between;
   align-items: center;
   height: 20px;
}

.card_like {
   width: 20px;
   border: none;
   background: none;
   margin-right: 20px;
}


.footer a {
   text-decoration: none; /* 텍스트 데코레이션 제거 */
   color: inherit; /* 링크의 색상을 부모 요소로부터 상속 */
}

.footer a:hover {
   text-decoration: none; /* 호버 시 텍스트 데코레이션 제거 유지 */
   color: inherit; /* 호버 시 색상을 부모 요소로부터 상속 */
}

#topButton {
   position: fixed;
   bottom: 20px;
   right: 30px;
   z-index: 99;
   border: none;
   outline: none;
   background-color: #ff6f0f;
   color: white;
   cursor: pointer;
   padding: 15px;
   border-radius: 10px;
}

#topButton:hover {
   background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
   color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}

#likeImg {
   width: 30px;
   height: 30px;
}
</style>
<script>
   $(document).ready(
         function() {
            //맨위로 올리기
            $("html, body").animate({
               scrollTop : 0
            }, 400);

            // 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
            $("#myBtn").click(function() {
               $("html, body").animate({
                  scrollTop : 0
               }, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
            });

            // 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
            $(".menu-icon").click(function(e) {
               e.stopPropagation(); // 햄버거 아이콘을 클릭한 경우, document.body의 클릭 이벤트 전파 방지
               $(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
            });

            // 문서 클릭 이벤트: 메뉴 영역이나 아이콘 외부를 클릭하면 메뉴 숨김
            $(document.body).click(
                  function(e) {
                     if (!$(e.target).closest('.menu-container').length
                           && !$(e.target).hasClass('menu-icon')) {
                        $(".menu-container").slideUp();
                     }
                  });
         });
</script>
</head>
<body>
   <%
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
   List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
   if (user != null && selectedUser != null) {
      LoginDTO firstSelectedUser = selectedUser; // Assuming you want the first user in the list
   %>


   <header>
      <div class="header-logo">
         <div class="menu-icon">&#9776;</div>
         <form action="/testing/homePage">
            <button type="submit">Second Hands</button>
         </form>
      </div>

      <div class="menu-container">
         <ul>
            <li><h2></h2></li>
            <li><img
               src="${path}/images/<%=firstSelectedUser.getUser_image()%>"
               style="border-radius: 50%; width: 100px; height: 100px;">
               <h2>
                  <%
                  if (user != null && selectedUser != null) {
                  %>
                  Welcome,
                  <%=firstSelectedUser.getUser_nickname()%>님
               </h2></li>
            <li>
               <form action="/testing/myPage" method="post">
                  <input type="hidden" name="user_code"
                     value="<%=firstSelectedUser.getUser_code()%>">
                  <button type="submit">마이페이지 이동</button>
               </form>
            </li>
            <li>
               <form action="/testing/chattingList" method="post">
                  <input type="hidden" name="buy_code" placeholder="채팅 코드 입력"
                     value="<%=firstSelectedUser.getUser_code()%>">
                  <button type="submit">새 채팅 ${fn:length(chatList)} 개</button>


               </form>
            </li>
            <li>
               <form action="/testing/products/add">
                  <button type="submit">게시글작성</button>
               </form>
            </li>
            <li>
               <form action="/testing/showOrder">
                  <button type="submit">주문내역</button>
               </form>
            </li>
            <li>
               <form action="/testing/qna">
                  <button type="submit">문의하기</button>
               </form>
            </li>
            <li>
               <form action="/testing/logout" method="post">
                  <button type="submit">로그아웃</button>
               </form>
            </li>
            <%
            } else {
            %>
            <li><h2>로그인이 필요한 서비스입니다.</h2></li>
            <li>
               <form action="/testing/login">
                  <button type="submit">가입 및 로그인</button>
               </form>
            </li>
            <%
            }
            %>

         </ul>
      </div>
      <div class="header-btn">
         <form action="/testing/scrollHome">
            <button type="submit">중고거래</button>
         </form>
         <form action="/testing/localproductList" method="post">
            <input type="hidden" name="newLocation" value="${detail_loc}" />
            <button type="submit">동네거래</button>
         </form>
      </div>
      <%
      if (user != null && selectedUser != null) {
      %>
      <div class="header-btn2">
         <form action="/testing/logout" method="post">
            <button type="submit">로그아웃</button>
         </form>
      </div>
      <%
      } else {
      %>
      <form action="/testing/login">
         <button type="submit">로그인</button>
      </form>
      <%
      }
      %>


   </header>

   <div class="main-top">
     <div id="sort">
         <button id="srTime">최신순</button>|
         <button id="srClick">인기순</button>|
         <button id="srLike">관심상품</button>
         <div class="search">
            <input type="text" id="srSearch" value="" placeholder="검색어 입력">
            <img
               src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
         </div>
         <br> <br>
      </div>
      <div class="scrollWrap"></div>
   </div>
   <div class="footer"></div>


   <button id="topButton" title="Go to top">Top</button>

   <script>
    let sort_mode = ".localListTime"; // 정렬 기본값 : 최신순, 인기순 정렬 : ".getListClick"
    let userId = "${user.user_id}";
    
    let detail_loc = "${detail_loc}";
    
   let HeightY; //페이지당 나오는 아이템들 높이합
    let page; //초기 페이지
    let cursorH; //로드 시 스크롤 위치 조정
    let wrapH; //초기 wrap 높이
    let totalPage; // totalpage ajax에서 불러옴
    let loading = false; // 추가 데이터 로딩 중 여부
      let list= null;
    $("html, body").animate({scrollTop: 0}, 0);
    PageInit();
     loadPage(page);
     
     
    function PageInit(){
       //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 설정할 부분
       HeightY = 700; //페이지당 나오는 아이템들 높이합
       //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        page = 1; //초기 페이지
        cursorH = page*HeightY; //로드 시 스크롤 위치 조정
        wrapH = HeightY*5; //초기 wrap 높이
        loading = false; // 추가 데이터 로딩 중 여부
        
        $("body").css("height", 3500);
      $(".scrollWrap").empty();
      $(".footer").empty();
        $("html, body").animate({scrollTop: 0}, 0);
    }

    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 스크롤 기능
    // 스크롤 이벤트
    window.addEventListener("scroll", function() {
         const scrollY = window.scrollY;
           const pageHeight = document.body.scrollHeight;
           
           if (scrollY >= HeightY && page < totalPage) {
               page += 1;
               console.log("페이지"+ page)
               HeightY += cursorH;
               $("html, body").animate({scrollTop: (page-1)*cursorH}, 500);
               loadPage(page);
               wrapH += cursorH;
               $("body").css("height", wrapH);
          } 
           else if(scrollY >= HeightY && page == totalPage){
              page += 1;
              $("body").css("height", wrapH-(cursorH*3));
              let endSql = `         
                  <div style = 'height:200px; background-color: #333;  padding: 10px; text-align: center; color:white'>
            	  &copy; 2023 에이콘아카데미 최종프로젝트 <br>   
              <p><a href="https://github.com/dhdl2389">조장: 김재열</a> |
                    <a href="https://github.com/mvcfvsgdj">조원: 김민규 </a> |
                    <a href="https://github.com/kevinbj0">조원: 김병진 </a> |
                    <a href="https://github.com/LeeJungHoon1">조원: 이정훈 </a> |
                    <a href="https://github.com/lepio1999">조원: 허재혁 </a></p>
              </div>  
              `   
              $(".footer").append(endSql);
              $("body").css("height", 1000);
           }else if(totalPage == 0){
              page += 1;
              $("body").css("height", 1000);
           }
   });
    
     //페이지 로드
      function loadPage(pageNumber) {
       if (!loading) {
           loading = true;
           $.ajax({
               url: "localScroll?page=" + pageNumber + "&mode=" + sort_mode + "&detail_loc=" + detail_loc,
               type: "GET",
               success: function(data) {
                   list = data.loclist;
                   if( list.length !== 0){
                       totalPage = data.totalPage;
                       let sql = pageToString(list);
                       $(".scrollWrap").append(sql);
                   }else{
                      alert("해당 지역 내 상품이 없습니다.");
                       window.location.href = "/testing/homePage";
                                      }
                   loading = false;
               },
               error: function(error) {
                   console.log("Error:", error);
                   loading = false;
               }
           });
       }
   }    
    //str문 생성
     function  pageToString(list){
          let str = "";
          list.forEach(  ( item) => { 
               str += `         
                   <article class="card_wrap">
                <div class="card_image" style="background-image: url('${path}/images/<%="${item.board_img}" %>')"></div>
                   <h2 class="card_title">    <a class="card_a" href="/testing/products/detail?boardId=<%="${item.board_id}" %>&user_code=<%="${item.user_code}"%>">
                     <%="${item.board_title}"%>
                     </a></h2>
                <div class = "card_date"><%="${item.board_date}"%> </div>
                <div class="card_price"><%="${item.board_price}"%> 원</div>
                <div class="card_address"><%="${item.loc_code}"%>/<%="${item.detail_loc}"%></div>
                <div class="card_count">
                 조회 <%="${item.board_click}"%>
                   <button id = '<%="${item.board_id}"%>' class="card_like" onclick = "likeEvent('<%="${item.board_id}"%>')"></button>
                  </div>
                </article>
               `;
               //item.board_date 안들어감
      });
          
      list.forEach(  ( item) => { 
            likeLoad(item.board_id);
      });
       return str;
   }
     //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 스크롤 기능 END
   //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 관심상품 기능
    //좋아요 Insert
   function likeEvent(boardId) {
           $.ajax({
               url: "${path}/products/like",
               type: "POST",
               data: {
                   userId: userId,
                   boardId: boardId
               },
               success: function(data) {
                 if(data.onClick == false){
                    $("#"+boardId).empty();
                    //빈하트
                    $("#"+boardId).append(`<img id="likeImg" src="${path}/resources/product/heart.png">`);
                 }else if(data.onClick == true){
                    $("#"+boardId).empty();
                    //꽉찬 하트
                    $("#"+boardId).append(`<img id="likeImg" src="${path}/resources/product/hfull.png">`);
                 }
                 
                 $("#srLike").empty();
                 if(data.likeCount == 0){
                    $("#srLike").append("관심상품");
                 }else{
                    $("#srLike").append(data.likeCount + "개 담김");                    
                 }

               },
               error: function(error) {
                   console.log("Error:", error);
               }
           });
       }
    
    //좋아요 클릭 유무 따라 하트 출력
   function likeLoad(boardId) {
        $.ajax({
            url: "${path}/products/likeEvent",
            type: "POST",
            data: {
                userId: userId,
                boardId: boardId
            },
            success: function(data) {
              if(data == false){
                 $("#"+boardId).empty();
                 //빈하트
                 $("#"+boardId).append(`<img id="likeImg" src="${path}/resources/product/heart.png">`);
              }else if(data == true){
                 $("#"+boardId).empty();
                 //꽉찬 하트
                 $("#"+boardId).append(`<img id="likeImg" src="${path}/resources/product/hfull.png">`);
              }
            },
            error: function(error) {
                console.log("Error:", error);
            }
        });
    }
    
    //관심목록 출력
    function LikeList(){
       if (!loading) {
         loading = true;
         $.ajax({
            url: "${path}/likeList",
            type: "POST",
            data: {userId:userId},
            success: function(data) {
               let list = data;
               let sql = pageToString(list);
               $(".scrollWrap").empty();
               $(".scrollWrap").append(sql);
   
               loading = false;
            },
            error: function(error) {
               console.log("Error:", error);
               loading = false;
            }
         });
      }
       
    }
     //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 좋아요 기능 END
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 부가기능 : 맨위로
    //맨위로 올리기
   $(document).ready(function() {
      //초기 스크롤
      $("html, body").animate({scrollTop: 0}, 0);

      //맨 위로
      $("#topButton").click(function() {
         $("html, body").animate({scrollTop: 0}, 1000);
      });

      //시간순 정렬
      $("#srTime").click(function() {
         sort_mode = ".localListTime";
         PageInit();
         loadPage(page);
      });

      //인기순 정렬
      $("#srClick").click(function() {
         sort_mode = ".localListClick";
         PageInit();
         loadPage(page);
      });
      
      //관심 상품 정렬
      $("#srLike").click(function() {
         PageInit();
         totalPage=0;
         LikeList();
      });
      
      //검색
      $("#srSearch").on('input', function() {
         let searchTerm = $("#srSearch").val();
         loadSearchResults(searchTerm);
      });

      function loadSearchResults(searchTerm) {
         $.ajax({
            url: "search?searchTerm=" + searchTerm,
            type: "GET",
            success: function(data) {
               let resultHtml = pageToString(data);
               $(".scrollWrap").empty().append(resultHtml);
            },
            error: function(error) {
               console.log("Error:", error);
            }
         });
      }
      
   });
</script>
   <%
   }
   %>

</body>
</html>