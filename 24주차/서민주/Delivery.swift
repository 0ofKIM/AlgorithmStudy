import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    let MAX = 500001
    var answer = [MAX, 0] + Array(repeating: MAX, count: N-1)
    var map = [Int: [Int]]()
    var distMap = Array(repeating: Array(repeating: MAX, count: N+1), count: N+1)
    
    for r in road {
        let (a, b, dist) = (r[0], r[1], r[2])
        if !map.keys.contains(a) { map[a] = [Int]() } 
        if !map.keys.contains(b) { map[b] = [Int]() }
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
            let dist = answer[start] + distMap[start][end]
            if dist < answer[end] && dist <= k {
                answer[end] = dist	
                queue.append(end)   
            }
        }
    }
        
    return answer.count - answer.filter{ $0 == MAX }.count
}
