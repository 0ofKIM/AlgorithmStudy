import Foundation

enum direction {
    case down
    case straight
    case up
}

func solution(_ n:Int) -> [Int] {
    var result = Array(repeating: [Int](), count: n)
    var direction: direction = .down // 진행방향
    var value: Int = 1 // 숫자 값
    var row: Int = 0 // 행
    var countInStroke: Int = n // 한 획에 그릴 갯수
    var thickness: Int = 0 // 양 옆 두께

    for stroke in 1...n {
        for snailCount in 1...countInStroke {
            switch direction {
            case .down:
                result[row].insert(value, at: thickness)
                row += snailCount==countInStroke ? 0 : 1
                if snailCount==countInStroke { direction = .straight }
            case .straight:
                result[row].insert(value, at: result[row].count-thickness)
                row -= snailCount==countInStroke ? 1 : 0
                if snailCount==countInStroke { direction = .up }
            case .up:
                result[row].insert(value, at: result[row].count-thickness)
                row -= snailCount==countInStroke ? -1 : 1
                if snailCount==countInStroke { direction = .down }
            }
            value += 1
        }

        if stroke % 3 == 0 { thickness += 1 }
        countInStroke -= 1
    }

    return result.reduce([]) { $0 + $1 }
}
