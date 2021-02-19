func solution(_ n:Int) -> Int {
    guard n > 1 else { return 1 }
    
    var dp = [1, 2]
    for i in (2..<n) {
        dp.append((dp[i-1] + dp[i-2]) % 1234567)
    }
    
    return dp[n-1]
}
