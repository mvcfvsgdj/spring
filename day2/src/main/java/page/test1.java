package page;
import java.util.Scanner;

public class test1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("첫 수 입력 (1 이상 100 이하):");
        int n = sc.nextInt();

        if (n < 1 || n > 100) {
            System.out.println("잘못된 입력 범위입니다. 1 이상 100 이하의 수를 입력하세요.");
            sc.close();
            return;
        }

        int[] arr = new int[n];

        System.out.println("나머지 " + n + " 개 입력 (각 수는 1 이상 100 이하):");
        for (int i = 0; i < n; i++) {
            int input = sc.nextInt();
            if (input < 1 || input > 100) {
                System.out.println("잘못된 입력 범위입니다. 1 이상 100 이하의 수를 입력하세요.");
                sc.close();
                return;
            }
            arr[i] = input;
        }

        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }

            int temp = arr[i];
            arr[i] = arr[minIndex];
            arr[minIndex] = temp;
        }

        System.out.println("오름차순 정렬:");
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }

        sc.close();
    }
    
    
}


