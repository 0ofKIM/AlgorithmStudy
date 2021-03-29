import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    let MAX = Int.max
    
    var distances = [MAX, 0] + Array(repeating: MAX, count: N-1)
    var map: [Int: [Int]] = Dictionary(uniqueKeysWithValues: (1...N).map { ($0, [Int]()) })
    var distMap = Array(repeating: Array(repeating: MAX, count: N+1), count: N+1)

    for r in road {
        let (a, b, dist) = (r[0], r[1], r[2])
        map[a]!.append(b)
        map[b]!.append(a)
        if distMap[a][b] > dist {
            distMap[a][b] = dist
            distMap[b][a] = dist
        }
    }

    var queue = [1]
    while !queue.isEmpty {
        let start = queue.removeFirst()
        for end in map[start]! {
            let dist = distances[start] + distMap[start][end]
            
            if dist < distances[end] && dist <= k {
                distances[end] = dist
                queue.append(end)
            }
        }
    }

    return distances.filter{ $0 <= k }.count
}
