package me.hellozin.ps.baekjoon;

import java.util.Scanner;

public class NandM1_15649 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();

        for (int i = 1; i <= N; i++) {
            dfs(i, N, M, "");
        }
    }

    private static void dfs(int num, int count, int depth, String sequence) {
        sequence = sequence + num + " ";
        depth--;

        if (depth == 0) {
            // print sequence
            System.out.println(sequence);
        } else {
            for (int i = num + 1; i <= count; i++) {
                dfs(i, count, depth, sequence);
            }
        }
    }
}
