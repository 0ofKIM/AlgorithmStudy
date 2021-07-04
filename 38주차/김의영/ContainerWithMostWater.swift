class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var result = 0
        var (leftPoint, rightPoint) = (0, height.count-1)
        
        while leftPoint < rightPoint {
            let areaWidth = rightPoint - leftPoint
            let areaHeight = min(height[leftPoint], height[rightPoint])
            let area = areaWidth*areaHeight
            result = result > area ? result : area

            if height[leftPoint] < height[rightPoint] { leftPoint += 1 }
            else { rightPoint -= 1 }
        }
        
        return result
    }
}
