import Foundation

func solution(_ land:[[Int]]) -> Int {
    var sumRow: [Int] = land[0]

    for row in 1..<land.count {
        var tempRow = sumRow
        for column in 0..<4 {
            tempRow[column] = land[row][column] + max(sumRow[(column+1) % 4], sumRow[(column+2) % 4], sumRow[(column+3) % 4])
        }
        sumRow = tempRow
    }

    return sumRow.max()!
}
