func solution() {
    let n = Int(readLine()!)!
    let sequence = (0..<n).map{ _ in Int(String(readLine()!))! }

    var stack: [Int] = [1]
    var stackNum = 2
    var result = "+\n"

    for number in sequence {

        while number >= stackNum {
            stack.append(stackNum)
            stackNum += 1
            result += "+\n"
        } 
        
        guard let last = stack.last, last == number else { 
            print("NO")
            return
        }

        if last == number {
            stack.removeLast()
            result += "-\n"
        }
    }
    print(result)
}

solution()
