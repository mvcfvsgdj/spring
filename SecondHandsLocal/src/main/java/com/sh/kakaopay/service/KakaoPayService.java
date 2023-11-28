package com.sh.kakaopay.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.sh.kakaopay.domain.KakaoPayReadyVO;
import com.sh.kakaopay.domain.KakaoPayApprovalVO;
import com.sh.order.domain.OrderDTO;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPayService {

   private static final String HOST = "https://kapi.kakao.com";

   private KakaoPayReadyVO kakaoPayReadyVO;
   private KakaoPayApprovalVO kakaoPayApprovalVO;

   public String kakaoPayReady(OrderDTO order) {

      System.out.println("22222222222222222222222222222222222222222222");
      RestTemplate restTemplate = new RestTemplate();

      // https://online-pay.kakao.com/mockup/v1/3d0da5a6ec1358544ab89523e1a42bd6cf3f1bc0b3eb4a89f430cdc8452b4f25/info?board_id=116&board_title=%EA%B3%B5%EA%B8%B0%EA%B3%84+%ED%8C%90%EB%A7%A4%ED%95%A9%EB%8B%88%EB%8B%A4&user_nickname=%EC%84%9C%EC%9A%B8%EC%9D%B8&board_price=12800&member_addr=%EA%B4%91%EC%A3%BC+%EB%82%A8%EA%B5%AC+2%EC%88%9C%ED%99%98%EB%A1%9C+1508&member_post=61738&detailed_address=sdaf&delivery_req=%ED%8A%B9%EB%B3%84+%EC%9A%94%EC%B2%AD+%EC%97%86%EC%9D%8C

      // 서버로 요청할 Header
      HttpHeaders headers = new HttpHeaders();
      headers.add("Authorization", "KakaoAK " + "6269aa4d1550235e3d6bc1d57d6fd461");
      headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
      headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

      // 서버로 요청할 Body
      MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
      params.add("cid", "TC0ONETIME");
      params.add("partner_order_id", order.getBoard_id());
      params.add("partner_user_id", order.getUser_nickname());
      params.add("item_name", order.getBoard_title());
      params.add("quantity", "1");
      params.add("total_amount", String.valueOf(order.getBoard_price()));
      params.add("tax_free_amount", "0");
      params.add("approval_url", "http://localhost:8090/kakaoPaySuccess");
      params.add("cancel_url", "http://localhost:8090/homePage");
      params.add("fail_url", "http://localhost:8090/homePage");

      System.out.println("아이디" + order.getBoard_id());
      System.out.println("아이디" + order.getUser_nickname());
      System.out.println("아이디" + order.getBoard_title());
      System.out.println("params" + params);

      // 헤더,바디 합치는 방법 .
      HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

      try {
         // RestTemplate= 카카오페이 데이터 보낼때 사용 ,
         kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
               KakaoPayReadyVO.class);

         log.info("ttgtgutgutgu" + kakaoPayReadyVO);

         return kakaoPayReadyVO.getNext_redirect_pc_url();

      } catch (RestClientException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (URISyntaxException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/pay";

   }

   public KakaoPayApprovalVO kakaoPayInfo(String pg_token, OrderDTO order) {
      System.out.println("44444444444444444444444444444444444444444444444");
      RestTemplate restTemplate = new RestTemplate();

      // 서버로 요청할 Header
      HttpHeaders headers = new HttpHeaders();
      headers.add("Authorization", "KakaoAK " + "6269aa4d1550235e3d6bc1d57d6fd461");
      headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
      headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
      System.out.println("헤더" + headers);

      // 서버로 요청할 Body
      MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
      params.add("cid", "TC0ONETIME");
      params.add("tid", kakaoPayReadyVO.getTid());
      params.add("partner_order_id", order.getBoard_id());
      params.add("partner_user_id",  order.getUser_nickname());
      params.add("pg_token", pg_token); 
      params.add("total_amount", String.valueOf(order.getBoard_price()));
      System.out.println("파람" + params);

      HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
      System.out.println("바디" + body);
      try {
         kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
               KakaoPayApprovalVO.class);
         log.info("fuishahfihasfiuadsfoius" + kakaoPayApprovalVO);

         return kakaoPayApprovalVO;

      } catch (RestClientException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (URISyntaxException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return null;
   }

}