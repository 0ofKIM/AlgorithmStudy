package me.hellozin.ps.baekjoon;

// https://www.acmicpc.net/problem/9663

import java.util.Scanner;

public class N_Queen {

    static int N = 0;
    static int[][] board;
    static int matchCase = 0;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        board = new int[N][N];

        dfs(0);
        System.out.println(matchCase);
    }

    private static void dfs(int row) {
        for (int col = 0; col < N; col++) {
            // board 값이 0 이상이면 퀸에게 공격받고 있는 칸
            if (board[row][col] > 0) {
                continue;
            }

            // 퀸을 놓을 수 있는 칸이 있고 마지막 퀸인 경우
            if (row == N - 1) {
                matchCase++;
                continue;
            }

            // 퀸을 row, col 위치에 놓는다
            moveQueen(row, col, 1);
            dfs(row + 1);
            // 퀸을 row, col 위치에서 제거한다
            moveQueen(row, col, -1);
        }
    }

    private static void moveQueen(int i, int j, int flag) {
        // 퀸에게 공격받는 칸의 값을 +1 한다
        for (int k = 0; k < N; k++) {
            for (int l = 0; l < N; l++) {
                if (k == i || l == j || k - i == l - j || k - i == j - l) {
                    board[k][l] += flag;
                }
            }
        }
    }
}
