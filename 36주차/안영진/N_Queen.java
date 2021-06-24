package me.hellozin.ps.baekjoon;

// https://www.acmicpc.net/problem/9663

import java.util.Scanner;

public class N_Queen {

    static int N = 0;
    static int[] board;
    static int matchCase = 0;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        board = new int[N];

        dfs(0);
        System.out.println(matchCase);
    }

    private static void dfs(int row) {
        boolean isSafe;
        // 현재 row에서 퀸을 놓을 수 있는 col을 탐색
        for (int col = 0; col < N; col++) {
            isSafe = true;
            // 현재 col이 이미 놓여진 퀸들에게 공격받는지 확인
            for (int queenRow = 0; queenRow < row; queenRow++) {
                // 현재 col이 공격받고 있으면 다음 col로 break
                int queenCol = board[queenRow];
                isSafe = isAttackedByQueen(row, col, queenRow, queenCol);
                if (!isSafe) {
                    break;
                }
            }
            // 퀸을 row, col에 놓을 수 있으면,
            if (isSafe) {
                if (row == N - 1) {
                    // 그게 마지막 퀸이면 정답 + 1
                    matchCase++;
                } else {
                    // 보드에 퀸을 놓고 다음 row로 이동
                    board[row] = col;
                    dfs(row + 1);
                }
            }
        }
    }

    private static boolean isAttackedByQueen(int currentRow, int currentCol, int queenRow, int queenCol) {
        return !(queenCol == currentCol                                  // 퀸과 같은 열
                || queenCol - (currentRow - queenRow) == currentCol     // 퀸의 왼쪽 대각선
                || queenCol + (currentRow - queenRow) == currentCol);   // 퀸의 오른쪽 대각선
    }
}
