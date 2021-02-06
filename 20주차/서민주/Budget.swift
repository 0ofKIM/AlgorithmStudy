import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sum = 0 
    var cnt = 0
    var d = d.sorted(by: <)

    for amount in d {
        if sum + amount > budget { break }
        else { 
            sum += amount 
            cnt += 1
        }
    }

    return cnt
}

