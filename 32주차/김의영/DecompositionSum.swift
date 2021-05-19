func solution() -> Int {
    let number = Int(String(readLine()!))!
    
    for i in 1..<number {
        if i >= 1 && i < 10 { 
            if number == i*2 { return i }
        }        
        
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
