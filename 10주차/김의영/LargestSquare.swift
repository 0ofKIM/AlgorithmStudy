import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var diagnalAnxis = 0
    var copiedBoard = board

    if copiedBoard.count == 1 { return copiedBoard[0].contains(1) ? 1 : 0 }

    for rowIndex in 1..<copiedBoard.count {
        for colIndex in 1..<copiedBoard[rowIndex].count {
            if copiedBoard[rowIndex-1][colIndex] > 0 && copiedBoard[rowIndex][colIndex-1] > 0 && copiedBoard[rowIndex][colIndex] != 0 {
                copiedBoard[rowIndex][colIndex] += min(copiedBoard[rowIndex-1][colIndex], copiedBoard[rowIndex][colIndex-1], copiedBoard[rowIndex-1][colIndex-1])
                diagnalAnxis = max(diagnalAnxis, copiedBoard[rowIndex][colIndex])
            }
        }
    }

    return diagnalAnxis * diagnalAnxis
}
