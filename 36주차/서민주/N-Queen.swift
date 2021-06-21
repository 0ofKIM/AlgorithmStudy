if let N = Int(readLine()!) {
    var answer = 0
    var queen = [Int](repeating: -1, count: N)  // index: row, value: col
    let range = N % 2 == 0 ? 0..<N/2 : 0..<N
    
    func isPossible(_ newRow: Int, _ newCol: Int) -> Bool {
        guard !queen[..<newRow].contains(newCol) else { return false }

        for (row, col) in queen[..<newRow].enumerated() where newRow - row == abs(col - newCol) { 
            return false 
        }
        return true
    }

    func NQueen(_ row: Int) {
        guard row < N else { 
            answer += 1
            return 
        }

        for col in row == 0 ? range : 0..<N where isPossible(row, col) {
            queen[row] = col
            NQueen(row + 1)
        }
    }

    NQueen(0)
    print(N % 2 == 0 ? answer * 2 : answer)
}
