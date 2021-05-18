/*

- 문제: 분해합
- link: https://www.acmicpc.net/problem/2231
- 12840 KB
- 112 ms

*/

import java.util.Scanner;

public class DecompositionSum_2231 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int target = scanner.nextInt();
        int answer = 0;

        // target 의 자릿수
        int digitCount = getDigitCount(target);

        // 0 부터 시작하지 않고 최대한 큰 수부터 trace
        // target 이 abcd 라면 abcd - (a+9+9+9) 값부터 시작
        // 최적은 아니지만 적당히 큰 값
        int traceStartNumber = getTraceStartNumber(target, digitCount);

        for (int i = traceStartNumber; i < target; i++) {
            if (getDecompositionSum(i) == target) {
                answer = i;
                break;
            }
        }
        System.out.println(answer);
    }

    private static int getDigitCount(int number) {
        int digitCount = 1;
        int divider = 10;
        while (number / divider > 0) {
            digitCount++;
            divider *= 10;
        }
        return digitCount;
    }

    private static int getTraceStartNumber(int target, int digitCount) {
        return target - ((target / (int) Math.pow(10, digitCount - 1)) + (9 * (digitCount - 1)));
    }

    private static int getDecompositionSum(int origin) {
        int sum = origin;
        while (origin > 0) {
            sum += origin % 10;
            origin /= 10;
        }
        return sum;
    }

}