let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (input[0], input[1])
let board = (0..<N).map{ _ in readLine()!.map{ String($0) }}

func shouldRepaint( _ i: Int, _ j: Int) -> Bool {
    return board[i][j] != ((i + j) % 2 == 0 ? "B" : "W" )
}

var min = 64
for i in 0...(N-8) {
    for j in 0...(M-8) {
        var repaint = 0
        for ii in i..<i+8 { 
            for jj in j..<j+8 where shouldRepaint(ii, jj) { 
                repaint += 1
            }
        }
        if repaint > 32 { repaint = 64-repaint }
        if repaint < min { min = repaint}
    }
}
print(min)let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (NM[0], NM[1])
let board = (0..<N).map{ _ in readLine()!.map{ String($0) }}

func shouldRepaint( _ i: Int, _ j: Int) -> Bool {
    return board[i][j] != ((i + j) % 2 == 0 ? "B" : "W" )
}

var min = 64
for i in 0...(N-8) {
    for j in 0...(M-8) {
        var repaint = 0
        for ii in i..<i+8 { 
            for jj in j..<j+8 where shouldRepaint(ii, jj) { 
                repaint += 1
            }
        }
        if repaint > 32 { repaint = 64 - repaint }
        if repaint < min { min = repaint}
    }
}
print(min)
