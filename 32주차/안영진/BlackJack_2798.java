/*
 * 문제: 블랙잭
 * link: https://www.acmicpc.net/problem/2798
 * 18256KB / 236ms
 * */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BlackJack_2798 {

    public static void main(String[] args) {
        int N = 0;
        int M = 0;
        int[] cards = null;

        // Start init
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        try {
            String[] splitLine = reader.readLine().split(" ");
            N = Integer.parseInt(splitLine[0]);
            M = Integer.parseInt(splitLine[1]);

            cards = new int[N];
            splitLine = reader.readLine().split(" ");
            for (int i = 0; i < N; i++) {
                cards[i] = Integer.parseInt(splitLine[i]);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        // Finish init

        System.out.println(bruteForceTrace(cards, N, M));
    }

    public static int bruteForceTrace(int[] cards, int N, int M) {
        int max = 0;
        int sum = 0;
        for (int i = 0; i < N - 2; i++) {
            // n^3 마다 access & operation 하지않고
            // 미리 계산된 값 재사용
            sum += cards[i];
            for (int j = i + 1; j < N - 1; j++) {
                sum += cards[j];
                for (int k = j + 1; k < N; k++) {
                    sum += cards[k];

                    // 최적 해가 나온경우 early return
                    if (sum == M) {
                        return M;
                    }

                    if (sum > max && sum < M) {
                        max = sum;
                    }
                    sum -= cards[k];
                }
                sum -= cards[j];
            }
            sum -= cards[i];
        }
        return max;
    }
}
