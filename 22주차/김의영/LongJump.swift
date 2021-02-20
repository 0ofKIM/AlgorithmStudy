func solution(_ n:Int) -> Int {
    if n == 1 || n == 2 { return n }

    var result = [1, 2]
    for i in 1...n-1 {
        result.append((result[i-1] + result[i]) % 1234567)
    }

    return result[n-1]
}
