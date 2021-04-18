let NM = readLine()!.split(separator: " ").map({ Int(String($0))! })
let (N, M) = (NM[0], NM[1])
let map = (0..<N).map({ _ in readLine()!.map({ String($0) == "1" }) })

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var visit = Array(repeating: Array(repeating: [0, 0], count: M), count: N)
var q = [(x: 0, y: 0, didBreak: 0)]
var result = -1

visit[0][0][0] = 1

while !q.isEmpty {
    let (x, y, didBreak) = q.removeFirst()

    if (x, y) == (N-1, M-1) {
        result = visit[x][y][didBreak]
        break
    }
    
    for i in 0..<4 {
        let (nx, ny) = (x + dx[i], y + dy[i])
        guard 0..<N ~= nx && 0..<M ~= ny && visit[nx][ny][didBreak] == 0 else { continue }

        if !map[nx][ny] {
            q.append((nx, ny, didBreak))
            visit[nx][ny][didBreak] = visit[x][y][didBreak]+1
        } else if didBreak == 0 {
            q.append((nx, ny, 1))
            visit[nx][ny][0] = visit[x][y][0] + 1
            visit[nx][ny][1] = visit[nx][ny][0]
        }
    }   
}

print(result)
