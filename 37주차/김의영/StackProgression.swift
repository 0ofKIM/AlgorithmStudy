func solution() {
    let n: Int = Int(readLine()!)!
    var number: Int = 1
    var stack: [Int] = []
    var returnString: String = ""
    
    for _ in 0..<n {
        let targetNumber = Int(readLine()!)!
        
        while true {
            if stack.isEmpty || stack.last! < targetNumber {
                stack.append(number)
                number += 1
                returnString.append("+\n")
            } else if stack.last! == targetNumber {
                stack.removeLast()
                returnString.append("-\n")
                break
            } else {
                print("NO")
                return
            }
        }
    }
    print(returnString)
}

solution()
