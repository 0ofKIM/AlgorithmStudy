/*

- 문제: 덩치
- link: https://www.acmicpc.net/problem/7568
- 11488 KB
- 88 ms

*/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Bulk_7568 {

    public static void main(String[] args) {
        int N; int[] x, y; // input 처리 생략

        int[] rank = new int[N];
        // 전체 쌍을 한번씩 비교
        for (int i = 0; i < N - 1; i++) {
            for (int j = i + 1; j < N; j++) {
                // A가 B보다 작은 경우 -> A의 순위 + 1
                if (x[i] < x[j] && y[i] < y[j]) {
                    rank[i]++;
                // A가 B보다 클 경우 -> B의 순위 + 1
                } else if (x[i] > x[j] && y[i] > y[j]) {
                    rank[j]++;
                }
                // A와 B를 비교할 수 없는 경우 skip
            }
        }

        // 정답 출력
        System.out.print(rank[0] + 1);
        for (int i = 1; i < N; i++) {
            System.out.print(" " + (rank[i] + 1));
        }
    }

}
