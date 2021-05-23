func isContain666(_ number: Int) -> Bool {
    var (count, num) = (0, number)
    
    for _ in 0..<String(num).count {
        count += num % 10 == 6 ? 1 : 0
        
        if count == 3 { break }
        num /= 10
    }
    
    return count == 3
}

if let index = Int(readLine()!) {
    var count = 0
    for number in 666...Int.max where isContain666(number) {
        count += 1
        
        if count == index {
            print(number)
            break
        }
    }
}
