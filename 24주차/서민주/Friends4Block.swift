func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var reversedBoard: [[String]] = Array(repeating: Array(repeating: "", count: m), count: n)
    
    for (i, row) in board.reversed().enumerated() {
        for (j, block) in row.enumerated() {
            reversedBoard[j][i] = String(block)
        }
    }
    
    func checkSquare(_ i: Int, _ j: Int) -> Bool {
        let mask = [(0, 1), (1, 0), (1, 1)]
        let char = reversedBoard[i][j]
        
        var willRemove = true
        for (x, y) in mask {
            willRemove = willRemove && char == reversedBoard[i+x][j+y]
        }
        return willRemove
    }
    
    var canDelete: Bool = true
    
    while canDelete {
        var delete: [[Bool]] = (0..<reversedBoard.count).map { Array(repeating: false, count: reversedBoard[$0].count) }
        
        canDelete = false
        for i in 0..<reversedBoard.count-1 where reversedBoard[i].count > 1 {
            for j in 0..<reversedBoard[i].count-1 {
                if j+1 < reversedBoard[i+1].count && checkSquare(i, j) {
                    (delete[i][j], delete[i][j+1], delete[i+1][j], delete[i+1][j+1]) = (true, true, true, true)
                    canDelete = true
                }
            }
        }
        
        for i in stride(from: reversedBoard.count-1, through: 0, by: -1) {
            for j in stride(from: reversedBoard[i].count-1, through: 0, by: -1) where delete[i][j] {
                reversedBoard[i].remove(at: j)
            }
        }
    }
    
    return m * n - reversedBoard.reduce(0, {$0 + $1.count})
}
