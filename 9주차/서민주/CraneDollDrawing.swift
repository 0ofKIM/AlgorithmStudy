import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    let N = board.count
    var answer = 0
    var grid = [[Int]](repeating: [Int](), count: N)
    var basket = [Int]()
    
    for row in 0..<N {
        for col in 0..<N {
            if board[row][col] != 0 {
                grid[col].insert(board[row][col], at: 0)
            }
        }
    }
    
    for move in moves {
        if let last = grid[move-1].last {
            grid[move-1].removeLast()
            
            if let pick = basket.last, pick == last {
                basket.removeLast()
                answer += 2
            } else {
                basket.append(last)
            }
        }
    }
    
    return answer
}
