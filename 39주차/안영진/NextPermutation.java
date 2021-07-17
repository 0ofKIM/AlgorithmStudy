
// https://leetcode.com/problems/next-permutation/

public class NextPermutation {

    public void nextPermutation(int[] nums) {
        final int length = nums.length;
        
        // skip when length is 1
        if (length == 1) {
            return;
        }

        int index = nums.length - 2;

        // find swap target
        while (index >= 0 && nums[index] >= nums[index + 1]) {
            index--;
        }

        // if already perfect DESC, set to ASC and return
        if (index == -1) {
            int half = length/2;

            for (int i = 0; i < half; i++) {
                swapInPlace(nums, i, length - i - 1);
            }
            return;
        }

        int swapTargetIdx = index;
        int swapTarget = nums[swapTargetIdx];

        // find swap source
        int swapSourceIdx = index;
        while (swapSourceIdx < length - 1 && swapTarget < nums[swapSourceIdx + 1]) {
            swapSourceIdx++;
        }
        
        // swap
        int swapSource = nums[swapSourceIdx];
        nums[swapSourceIdx] = swapTarget;
        nums[swapTargetIdx] = swapSource;

        // rearrange tail to ASC
        int half = swapTargetIdx + 1 + ((nums.length - (swapTargetIdx + 1)) / 2);
        for (int i = swapTargetIdx + 1; i < half; i++) {
            swapInPlace(nums, i, length - (i - swapTargetIdx));
        }
    }
    
    private void swapInPlace(int[] arr, int srcIdx, int dstIdx) {
        int src = arr[srcIdx];
        arr[srcIdx] = arr[dstIdx];
        arr[dstIdx] = src;
    }
}
