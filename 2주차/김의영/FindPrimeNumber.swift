import Foundation

func solution(_ n:Int) -> Int {
    var numArray: [Bool] = Array(repeating: true, count: n)
    var answer = 0
    
    for num in 2...n {
        if numArray[num-1] {
            answer += 1
            for j in stride(from: num+num, through: n, by: num) {
                numArray[j-1] = false
            }
        }
    }
    
    return answer
}
