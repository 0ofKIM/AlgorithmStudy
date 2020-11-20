import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {

    func dfs(_ sum: Int, _ index: Int) -> Int {
        if index == numbers.count { return sum == target ? 1 : 0 }
        return dfs(sum-numbers[index], index+1) + dfs(sum+numbers[index], index+1)
    }
    
    return dfs(0, 0)
}
