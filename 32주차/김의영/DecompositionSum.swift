func solution() -> Int {
    let number = Int(String(readLine()!))!
    guard number > 9 else { return 0 }
    
    for i in 10..<number {
        var (mutableNumber, sum) = (i, i)
        
        while mutableNumber > 0 && sum <= number {
            sum += mutableNumber%10
            mutableNumber /= 10
        }
        
        if sum == number { return i }
    }
    
    return 0
}

print(solution())
