class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var index = 0
        var isDescending = true
        
        for swapSource in stride(from: nums.count-2, through: 0, by: -1) {
            if nums[swapSource] < nums[swapSource+1] { 
                isDescending = false
                
                var swapTarget = swapSource+1
                for i in swapSource+1..<nums.count where nums[swapSource]+1...nums[swapTarget] ~= nums[i] {
                    swapTarget = i
                }
                nums.swapAt(swapSource, swapTarget)

                for i in 1..<(nums.count-swapSource+1)/2 {
                    nums.swapAt(swapSource+i, nums.count-i)
                }
                
                break
            }
        }
        
        guard !isDescending else { 
            nums.reverse()
            return
        }
    }
}

