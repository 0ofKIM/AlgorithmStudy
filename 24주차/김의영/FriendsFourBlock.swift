import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var count = 0
    var copiedBoard = Array(repeating: Array(repeating: "0", count: n), count: m)
    var isCheck = true
    for m in 0..<m {
        let alphabets = board[m].map { String($0) }
        for n in 0..<n {
            copiedBoard[m][n] = alphabets[n]
        }
    }

    while isCheck {
        isCheck = false
        var visitBoard = Array(repeating: Array(repeating: 0, count: n), count: m)

        for m in 0..<m-1 {
            for n in 0..<n-1 {
                if copiedBoard[m][n] == "0" { continue }

                let isFourBlock = (copiedBoard[m][n] == copiedBoard[m][n+1]) && (copiedBoard[m][n] == copiedBoard[m+1][n]) && (copiedBoard[m][n] == copiedBoard[m+1][n+1])
                if isFourBlock {
                    visitBoard[m][n] = 1
                    visitBoard[m][n+1] = 1
                    visitBoard[m+1][n] = 1
                    visitBoard[m+1][n+1] = 1
                    isCheck = true
                }
            }
        }

        for i in 0..<m where isCheck {
            for j in 0..<n where visitBoard[i][j] == 1 {
                if i != 0 {
                    for row in (0...i-1).reversed() { copiedBoard[row+1][j] = copiedBoard[row][j] }
                }
                copiedBoard[0][j] = "0"
                count += 1
            }
        }
    }

    return count
}
