import Foundation

func dfs(_ numbers: [Int], _ target: Int, _ index: Int, _ sum: Int, _ answer: inout Int) {
    if index >= numbers.count {
        if target == sum { answer += 1 }
        return
    }

    dfs(numbers, target, index+1, sum+numbers[index], &answer)
    dfs(numbers, target, index+1, sum-numbers[index], &answer)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    dfs(numbers, target, 0, 0, &answer)

    return answer
}
