package com.acorn.day1.di;
import java.util.Scanner;

public class test {

    public static void main(String[] args) {
       
		Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();  // 보낸 문자의 개수
        String signal = sc.next();  // 문자의 개수의 일곱 배 만큼의 # 또는 * 신호

        String result = decodeSignal(signal);
        System.out.println(result);
    }

    private static String decodeSignal(String signal) {
        StringBuilder resultBuilder = new StringBuilder();
        
        for (int i = 0; i < signal.length(); i += 7) {
            String binarySignal = signal.substring(i, i + 7).replace('#', '1').replace('*', '0');
            int decimalValue = Integer.parseInt(binarySignal, 2);
            char decodedChar = (char) decimalValue;
            resultBuilder.append(decodedChar);
        }

        return resultBuilder.toString();
    }
}