import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var b = board
    var answer = 0

    for row in 0..<board.count {
        for col in 0..<board.first!.count {
            
            if row * col == 0 { continue }
            if b[row][col] == 1 {
                b[row][col] = min(b[row-1][col], b[row][col-1], b[row-1][col-1]) + 1
            }
        }
    }
    answer = b.map({$0.max()!}).max()!
    return answer * answer
}
