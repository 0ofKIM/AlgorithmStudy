import Foundation

let NM = readLine()?.components(separatedBy: " ")
let (M,N) = (Int(NM![0])!, Int(NM![1])!)
var fullBoard: [[String]] = Array(repeating: Array(repeating: "", count: N), count: M)
for i in 0..<M {
    if let line = readLine() {
        for (j, color) in line.enumerated() {
            fullBoard[i][j] = String(color)
        }
    }
}

func solution() {
    var minimumValue = Int.max
    for checkNCount in 0...(N-8) {
        for checkMCount in 0...(M-8) {
            var tempBoard: [[String]] = []
            makeTempBoard(checkNCount, checkMCount, board: &tempBoard)
            
            minimumValue = repaintingCount(board: tempBoard, startColor: tempBoard[0][0], minimumValue: minimumValue)
            minimumValue = repaintingCount(board: tempBoard, startColor: tempBoard[0][0] == "W" ? "B" : "W", minimumValue: minimumValue)
        }
    }

    print(minimumValue == Int.max ? 0 : minimumValue)
}

func makeTempBoard(_ checkNCount: Int, _ checkMCount: Int, board: inout [[String]]) {
    for M in checkNCount..<checkNCount+8 {
        var line: [String] = []
        for N in checkMCount..<checkMCount+8 {
            line.append(fullBoard[N][M])
        }
        board.append(line)
    }
}

func repaintingCount(board: [[String]], startColor: String, minimumValue: Int) -> Int {
    var value = 0
    var colorFlag = startColor
    
    for i in 0..<8 {
        for j in 0..<8 {
            if value > minimumValue { return minimumValue }
            
            if board[i][j] != colorFlag { value += 1 }
            if j < 7 { colorFlag = (colorFlag == "W") ? "B" : "W" }
        }
    }
    
    return value > minimumValue ? minimumValue : value
}

solution()
