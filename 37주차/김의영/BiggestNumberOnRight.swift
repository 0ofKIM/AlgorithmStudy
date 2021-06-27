func solution() {
    let n = Int(readLine()!)!
    let number = readLine()!.split(separator: " ").map { Int(String($0))! }
    var indexStack: [Int] = []
    var result = Array(repeating: "-1", count: n)
    
    for i in 0..<n {
        while !indexStack.isEmpty && number[indexStack.last!] < number[i] {
            let index = indexStack.popLast()!
            result[index] = "\(number[i])"
        }
        
        indexStack.append(i)
    }
    
    print(result.joined(separator: " "))
}

solution()
