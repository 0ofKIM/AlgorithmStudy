package me.hellozin.ps.baekjoon;

// https://www.acmicpc.net/problem/1874

import java.util.Scanner;
import java.util.Stack;

public class SequenceStack {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();

        Stack<Integer> stack = new Stack<>();
        StringBuilder answer = new StringBuilder();

        int seqNum = 1;

        for (int i = 0; i < N; i++) {
            int currentSeqNum = scanner.nextInt();

            while (stack.isEmpty() || stack.peek() < currentSeqNum) {
                stack.push(seqNum++);
                answer.append("+\n");
            }

            if (!stack.isEmpty() && stack.peek() == currentSeqNum) {
                stack.pop();
                answer.append("-\n");
            } else {
                System.out.println("NO");
                return;
            }
        }

        if (stack.isEmpty()) {
            System.out.println(answer.toString());
        } else {
            System.out.println("NO");
        }
    }
}
