class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var (i, j) = (0, height.count-1)
        
        while i < j {
            maxArea = max(maxArea, min(height[i], height[j]) * (j-i))
            if height[i] < height[j] { i += 1 } 
            else { j -= 1 }
        }

        return maxArea
    }
}
