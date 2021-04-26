let NM = readLine()!.split(separator: " ").map({ Int(String($0))! })
let (N, M) = (NM[0], NM[1])

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var map = (0..<N).map({ _ in readLine()!.map({ (Int(String($0)), false) }) })
var q = [(x: 0, y: 0, broken: false)]

map[0][0] = (2, false)
var dist = 0
var idx = 0
var success = false

loop: while idx < q.count {
    dist += 1
    for i in idx..<q.count {
        let node = q[i]
        if node.x == N-1 && node.y == M-1 {
            success = true
            break loop
        }
        for i in 0...3 {
            let (nx, ny) = (node.x + dx[i], node.y + dy[i])
            guard 0..<N ~= nx && 0..<M ~= ny else { continue }
            
            let (visited, brokenSpace) = map[nx][ny]
            if visited == 0 {
                map[nx][ny] = (2, node.broken)
                q.append((nx, ny, node.broken))
            } else if visited == 1 && !node.broken {
                map[nx][ny] = (-1, true)
                q.append((nx, ny, true))
            } else if visited == 2 && !node.broken && brokenSpace {
                map[nx][ny] = (2, false)
                q.append((nx, ny, false))
            }
        }
        idx += 1
    }
}
print(success ? dist : -1)
