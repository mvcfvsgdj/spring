<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <form name="fcate" method="post">
        카테고리 대 : <span id="cate1"></span> <br>
        카테고리 중 : <span id="cate2"><select name='cate2'><option value=''>=모델명=</option></select></span> <br>
        카테고리 소 : <span id="cate3"><select name='cate3'><option value=''>=등급명=</option></select></span>
    </form>

    <script>
        var arrBig = ["", "현대", "삼성", "기아"];
        var arrMid = [[], ["", "라비타", "그랜저 XG", "스텔라"], ["", "SM5"], ["", "카렌스 II", "옵티마"]];
        var arrSml = [
            [[]],
            [[], ["", "1.5 DOHC 가솔린 TR", "1.8 DOHC 가솔린 CR"], ["", "Q20", "Q30", "Q40"], ["", "미등록"]],
            [[], ["", "SM525V", "SM520SE"]],
            [[], ["", "미등록"], ["", "opt200"]]
        ];

        function fnCateInit() {
            var $cate1 = $("#cate1");
            var $select1 = $("<select name='cate1'>");
            
            $.each(arrBig, function(index, item) {
                $select1.append("<option value='" + item + "'>" + item + "</option>");
            });

            $cate1.html($select1);
            $select1.on("change", fnCate2Chg);
            fnCate2Chg(); // 초기화
        }

        function fnCate2Chg() {
            var $cate2 = $("#cate2");
            var $select2 = $("<select name='cate2'>");
            var gap = $("select[name='cate1']").val();
            var bigNum = arrBig.indexOf(gap);

            $.each(arrMid[bigNum], function(index, item) {
                $select2.append("<option value='" + item + "'>" + item + "</option>");
            });

            $cate2.html($select2);
            $select2.on("change", fnCate3Chg);
            fnCate3Chg(); // 초기화
        }

        function fnCate3Chg() {
            var $cate3 = $("#cate3");
            var $select3 = $("<select name='cate3'>");
            var gap1 = $("select[name='cate1']").val();
            var gap2 = $("select[name='cate2']").val();
            var bigNum = arrBig.indexOf(gap1);
            var midNum = arrMid[bigNum].indexOf(gap2);

            $.each(arrSml[bigNum][midNum], function(index, item) {
                $select3.append("<option value='" + item + "'>" + item + "</option>");
            });

            $cate3.html($select3);
        }

        $(document).ready(function() {
            fnCateInit();
        });
    </script>
</body>
</html>