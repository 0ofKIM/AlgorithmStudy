import Foundation

func solution(_ n:Int) -> Int
{
    var answer = n+1
    while true {
        if n.nonzeroBitCount == answer.nonzeroBitCount { return answer }
        answer += 1
    }

    return answer
}
