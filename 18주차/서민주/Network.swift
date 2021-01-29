import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var cnt = 0
    var connected = Array(repeating: false, count: n)
    
    func dfs(_ i: Int) {
        connected[i] = true
        
        for j in 0..<n where computers[i][j] == 1 && !connected[j] {
            dfs(j)
        }
    }
    
    for i in 0..<n where !connected[i] {
        cnt += 1
        dfs(i)
    }
    
    return cnt
}
