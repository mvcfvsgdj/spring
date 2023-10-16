package com.acorn.inter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;

public class GoogleApiImp   implements GoogleApi{

	@Override
	public double[] 위도경도구하기() {
	 
	 		    String address = "서울특별시 강남구 역삼동 736-1";
			        // Google Maps Platform에서 발급받은 API 키를 입력합니다.
			        String apiKeys = "AIzaSyAsLpi_vMOsUZeIv2OpKyosmuE1i-k0OrY";

			        // Geocoding API의 URL을 생성합니다.
			        String apiUrl="";
					try {
						apiUrl = "https://maps.googleapis.com/maps/api/geocode/json" +
						                "?address=" + URLEncoder.encode(address, "UTF-8") +
						                "&key=" + apiKeys;
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

			        // API를 호출하여 위도와 경도 정보를 가져옵니다.
			        URL url;
			        StringBuilder response=null;
					try {
						url = new URL(apiUrl);
					    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
						connection.setRequestMethod("GET");
						
					    BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				         response = new StringBuilder();
				        String line;
				     
						while ((line = reader.readLine()) != null) {
						    response.append(line);
						}
						reader.close();
					 
					} catch (MalformedURLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ProtocolException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			    
					
					System.out.println( response.toString() );
			        

			        // 위도와 경도 정보를 출력합니다.
			        JSONObject jsonResponse = new JSONObject(response.toString());
			        JSONObject location = jsonResponse.getJSONArray("results")
			                                        .getJSONObject(0)
			                                        .getJSONObject("geometry")
			                                        .getJSONObject("location");
			        double latitude = location.getDouble("lat");
			        double longitude = location.getDouble("lng");
			        System.out.println("위도: " + latitude + ", 경도: " + longitude);
			        
			        double result[]    = new double[2];
			        result[0]= latitude;
			        result[1]= longitude; 
			        
					System.out.println( latitude+ "  " +  longitude );
					 
			     
				return result;	 

		 
	}

}
