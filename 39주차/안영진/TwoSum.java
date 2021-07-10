
// https://leetcode.com/problems/two-sum/

import java.util.HashMap;

public class TwoSum {

    public int[] twoSum(int[] nums, int target) {
        HashMap<Integer, Integer> candidates = new HashMap<>();
        for(int i = 0; i < nums.length; i++) {
            if (candidates.containsKey(nums[i])) {
                return new int[]{candidates.get(nums[i]), i};
            }

            int t = target - nums[i];
            candidates.put(t, i);
        }
        return new int[]{};
    }
}
