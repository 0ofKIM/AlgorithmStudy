import Foundation

// 학생 수 만큼 배열 1로 초기화 -> lost한 학생 배열값 -1, reserve 학생 앞 뒤 중 1명 배열값 +1 => reduce
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var state: [Int] = Array(repeating: 1, count: n)
    
    lost.forEach {
        if !reserve.contains($0) {
            state[$0-1] = 0
        }
    }
    reserve.forEach {
        let student = $0-1
        if !lost.contains($0) && state[student] == 1  {
            if student > 0 && state[student-1] == 0 {
                state[student-1] = 1
            }
            else if student < n-1 && state[student+1] == 0 {
                state[student+1] = 1
            }
        }
    }

    return state.reduce(0, +)
}
