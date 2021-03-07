import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var result = 0
    let MAX = 987654321
    var matrix: [[Int]] = []
    var distance: [Int] = [Int](repeating: MAX, count: N+1)
    var isVisit: [Bool] = [Bool](repeating: true, count: N+1)

    for _ in 0...N { matrix.append([Int](repeating: MAX, count: N+1)) }
    road.forEach {
        if $0[2] < matrix[$0[0]][$0[1]] { matrix[$0[0]][$0[1]] = $0[2] }
        if $0[2] < matrix[$0[1]][$0[0]] { matrix[$0[1]][$0[0]] = $0[2] }
    }

    shortestRoad(&distance, matrix, &isVisit, N)
    for time in distance where time <= k {
        result += 1
    }

    return result
}

func shortestRoad(_ distance: inout [Int],_ matrix: [[Int]], _ visited: inout [Bool], _ N: Int) {
    for i in 1...N { distance[i] = matrix[1][i] }
    distance[1] = 0
    visited[1] = false
    for _ in 1...N-2 {
        let nextVertex = selectPath(distance, N, visited)
        visited[nextVertex] = false
        for j in 1...N where visited[j] && distance[nextVertex] + matrix[nextVertex][j] < distance[j] {
            distance[j] = distance[nextVertex] + matrix[nextVertex][j]
        }
    }
}

func selectPath(_ distance: [Int], _ N: Int, _ visited: [Bool]) -> Int {
    var minWeight = 987654321
    var minPosition = -1

    for i in 1...N where minWeight > distance[i] && visited[i] {
        minWeight = distance[i]
        minPosition = i
    }
    return minPosition
}
