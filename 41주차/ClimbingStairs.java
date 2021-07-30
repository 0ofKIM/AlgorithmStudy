package me.hellozin.ps.leetcode.easy;

public class ClimbingStairs {

    public int climbStairs(int n) {
        int waysForBehindOneStep = 2;
        int waysForBehindTwoStep = 1;

        if (n < 3) {
            return n;
        }

        int waysForCurrentStep = -1;
        for (int step = 3; step <= n; step++) {
            waysForCurrentStep = waysForBehindOneStep + waysForBehindTwoStep;
            waysForBehindTwoStep = waysForBehindOneStep;
            waysForBehindOneStep = waysForCurrentStep;
        }
        return waysForCurrentStep;
    }

}
