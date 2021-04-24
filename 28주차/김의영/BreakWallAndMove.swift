import Foundation

func solution() -> Int {
    let lineXY = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (lineX, lineY) = (lineXY[0], lineXY[1])
    let map = (0..<lineX).map { readLine()!.map { $0 } }

    let directionHorizontal = [1, 0, -1, 0]
    let directionVertical = [0, 1, 0, -1]
    var visited = Array(repeating: Array(repeating: [0, 0], count: lineY), count: lineX)
    var queue = [(0, 0, 0)]

    visited[0][0][0] = 1
    while !queue.isEmpty {
        let (x, y, isBreak) = queue.removeFirst()


        if x == lineX-1 && y == lineY-1 { return visited[x][y][isBreak] }

        for i in 0..<4 {
            let (nextX, nextY) = (x+directionHorizontal[i], y+directionVertical[i])
//            guard nextX >= 0 && nextX < lineX && nextY >= 0 && nextY < lineY else { continue }
            guard 0..<lineX ~= nextX && 0..<lineY ~= nextY && visited[nextX][nextY][isBreak] == 0 else { continue }

            if map[nextX][nextY] == "0" {
                visited[nextX][nextY][isBreak] = visited[x][y][isBreak]+1
                queue.append((nextX, nextY, isBreak))
            } else if isBreak == 0 {
                visited[nextX][nextY][0] = visited[x][y][0] + 1
                visited[nextX][nextY][1] = visited[nextX][nextY][0]
                queue.append((nextX, nextY, 1))
            }
        }
    }

    return -1
}

print(solution())
