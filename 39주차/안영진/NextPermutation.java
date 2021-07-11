
// https://leetcode.com/problems/next-permutation/

public class NextPermutation {

    public void nextPermutation(int[] nums) {
        // skip when length is 1
        if (nums.length == 1) {
            return;
        }

        int index = nums.length - 2;

        // find swap target
        while (index >= 0 && nums[index] >= nums[index + 1]) {
            index--;
        }

        // if already perfect DESC, set to ASC
        if (index == -1) {
            int length = nums.length;
            int half = length / 2;

            for (int i = 0; i < half; i++) {
                int temp = nums[i];
                nums[i] = nums[length - i - 1];
                nums[length - i - 1] = temp;
            }
            return;
        }

        int swapTargetIdx = index;
        int swapTarget = nums[swapTargetIdx];

        // find swap source
        int swapSourceIdx = index + 1;
        while (swapSourceIdx < nums.length && swapTarget < nums[swapSourceIdx]) {
            swapSourceIdx++;
        }
        swapSourceIdx--;

        // swap
        int swapSource = nums[swapSourceIdx];
        nums[swapSourceIdx] = swapTarget;
        nums[swapTargetIdx] = swapSource;

        // rearrange tail to ASC
        int half = swapTargetIdx + 1 + ((nums.length - (swapTargetIdx + 1)) / 2);
        for (int i = swapTargetIdx + 1; i < half; i++) {
            int temp = nums[i];
            nums[i] = nums[nums.length - (i - swapTargetIdx)];
            nums[nums.length - (i - swapTargetIdx)] = temp;
        }
    }
}
