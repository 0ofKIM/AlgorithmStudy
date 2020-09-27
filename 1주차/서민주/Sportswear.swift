import Foundation

// 학생 수 만큼 배열 1로 초기화 -> lost한 학생 배열값 -1, reserve 학생 앞 뒤 중 1명 배열값 +1 => reduce
// reserve 배열이 정렬되어있지 않을 경우 고려
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var state: [Int] = Array(repeating: 1, count: n)

    lost.forEach {
        if !reserve.contains($0) {
            state[$0-1] = 0
        }
    }
    reserve.filter{!lost.contains($0)}.sorted().forEach {
        if state[$0-1] == 1 {
            if $0 > 1  && state[$0-2] == 0 {
                state[$0-2] = 1
            }
            else if $0 < n && state[$0] == 0 {
                state[$0] = 1
            }
        }
    }

    return state.reduce(0, +)
}
