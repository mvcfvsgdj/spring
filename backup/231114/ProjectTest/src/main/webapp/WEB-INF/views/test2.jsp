<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- PortOne SDK -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
</head>
<body>
    <button id="check_module">결제하기</button>
    <!-- 결제하기 버튼 생성 -->

    <script>
        $("#check_module").click(function () {
            IMP.init('imp73274265'); 
            IMP.request_pay({
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '주문명 : 고구마',
                amount: 20000,
                buyer_name: 'Navy',
                buyer_postcode: '123-456',
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    alert(msg);
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    alert(msg);
                    history.forward(-1);
                }
            });
        });
    </script>
</body>
</html>