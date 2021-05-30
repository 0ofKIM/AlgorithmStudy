package me.hellozin.ps.baekjoon;

import java.util.Scanner;

public class NandM1_15649 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();

        int[] used = new int[N+1];
        for (int i = 1; i <= N; i++) {
            dfs(i, N, M, used, "");
        }
    }

    private static void dfs(int num, int count, int depth, int[] used, String sequence) {
        sequence = sequence + num + " ";
        depth--;

        if (depth == 0) {
            // print sequence
            System.out.println(sequence);
        } else {
            used[num] = 1;
            for (int i = num + 1; i <= count; i++) {
                if (used[i] == 0) {
                    dfs(i, count, depth, used, sequence);
                }
            }
        }
        used[num] = 0;
    }
}
