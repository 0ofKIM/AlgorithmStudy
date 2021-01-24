import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var cnt = 0
    var connected = Array(repeating: false, count: n)
    
    func bfs(_ i: Int) {
        connected[i] = true
        
        for j in 0..<n { 
            if computers[i][j] == 1 && !connected[j] { 
                bfs(j)
            }
        }
    }
    
    (0..<n).forEach {
        if !connected[$0] {
            cnt += 1
            bfs($0)    
        }
    }
    
    return cnt
}
