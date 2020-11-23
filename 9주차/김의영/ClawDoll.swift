import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var copiedBoard = board
    var basket: [Int] = []
    var answer = 0

    moves.forEach {
        for deep in 0..<copiedBoard.count {
            if copiedBoard[deep][$0-1] != 0 {
                basket.append(copiedBoard[deep][$0-1])
                copiedBoard[deep][$0-1] = 0

                breakDoll()
                break
            }
        }
    }

    func breakDoll() {
        if basket.count > 1 {
            let lastIndex = basket.index(basket.endIndex, offsetBy: -1)
            let index = basket.index(basket.endIndex, offsetBy: -2)

            if basket[lastIndex] == basket[index] {
                basket.removeLast(2)
                answer += 2
            }
        }
    }

    return answer
}
