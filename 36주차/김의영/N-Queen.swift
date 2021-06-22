func backTracking(_ list : [Int], _ result: inout Int) {
    if list.count == n {
        result += 1
        return
    }

    for i in 0..<n {
        if list.count == 0 { backTracking(list+[i], &result) }
        else {
            var isPossible = true
            for j in 0..<list.count {
                let cross = (list.count - j)
                if list[j] == i || list[j] + cross == i || list[j] - cross == i {
                    isPossible = false
                    break
                }
            }

            if isPossible { backTracking(list+[i], &result) }
        }
    }
}

func solution(_ n : Int ) -> Int {
    var result = 0
    backTracking([], &result)

    return result
}

let n = Int(readLine()!)!
print(solution(n))
