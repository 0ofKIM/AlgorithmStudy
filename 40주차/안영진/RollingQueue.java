package me.hellozin.ps.baekjoon;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Deque;
import java.util.LinkedList;

public class RollingQueue_1021 {

    static final int LEFT = 0;
    static final int RIGHT = 1;

    public static void main(String[] args) throws IOException {
        // ========== get input data ==========
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        String[] firstLine = reader.readLine().split(" ");
        int queueSize = Integer.parseInt(firstLine[0]);
        int targetCount = Integer.parseInt(firstLine[1]);

        String[] secondLine = reader.readLine().split(" ");
        int[] targets = new int[targetCount];
        for (int i = 0; i < targetCount; i++) {
            targets[i] = Integer.parseInt(secondLine[i]);
        }
        // ========== get input data ==========

        // divide queue for decide effective rolling direction
        Deque<Integer> leftQueue = new LinkedList<>();
        Deque<Integer> rightQueue = new LinkedList<>();
        for (int i = 1; i < queueSize/2 + 1; i++) {
            leftQueue.add(i);
        }
        for (int i = queueSize/2 + 1; i <= queueSize; i++) {
            rightQueue.add(i);
        }

        int rollingOperationCount = 0;

        // for each target
        for (int target : targets) {

            // when left.size == 0 && right.size == 1
            // look with line 84
            if (leftQueue.isEmpty()) {
                leftQueue.offerLast(rightQueue.pollFirst());
            }

            // rolling
            if (leftQueue.peekFirst() != target) {
                // find target located at
                boolean targetLocatedAtLeftQueue = isTargetLocatedAtLeft(leftQueue, rightQueue, target);

                // decide rolling direction
                int direction = targetLocatedAtLeftQueue ? LEFT : RIGHT;
                while (leftQueue.peekFirst() != target) {
                    rollingQueue(leftQueue, rightQueue, direction);
                    rollingOperationCount++;
                }
            }

            // poll target
            leftQueue.pollFirst();

            // keep valance between left and right
            if (leftQueue.size() < rightQueue.size() - 1) {
                leftQueue.offerLast(rightQueue.pollFirst());
            }
        }
        System.out.println(rollingOperationCount);
    }

    private static boolean isTargetLocatedAtLeft(Deque<Integer> left, Deque<Integer> right, int target) {
        // example) left: [12, 15, 2, 3] right: [4, 5, 6, 7]
        boolean leftQueueContainsBorder = left.peekFirst() > left.peekLast();

        boolean targetLocatedAtLeftQueue = true;
        if (right.peekFirst() == target) {
            // if left.size < right.size, left rolling is better even target located at right.
            targetLocatedAtLeftQueue = true;
        } else if (leftQueueContainsBorder) {
            targetLocatedAtLeftQueue = (left.peekFirst() < target) || (target <= left.peekLast());
        } else {
            targetLocatedAtLeftQueue = (left.peekFirst() < target) && (target <= left.peekLast());
        }
        return targetLocatedAtLeftQueue;
    }

    private static void rollingQueue(Deque<Integer> left, Deque<Integer> right, int direction) {
        switch (direction) {
            case LEFT:
                right.offerLast(left.pollFirst());
                left.offerLast(right.pollFirst());
                break;
            case RIGHT:
                left.offerFirst(right.pollLast());
                right.offerFirst(left.pollLast());
                break;
        }
    }

}
