import Foundation

func solution() {
    let numberCount = readLine()!.split(separator: " ").map { Int(String($0))! }[0]
    var shouldFindNumbers = readLine()!.split(separator: " ").map { Int(String($0))! }
    var queue = (1...numberCount).map { $0 }
    var result = 0
    
    func pop() {
        queue.removeFirst()
        shouldFindNumbers.removeFirst()
    }
    
    func moveLeft() {
        queue.append(queue.removeFirst())
    }
    
    func moveRight() {
        queue.insert(queue.removeLast(), at: 0)
    }
    
    while shouldFindNumbers.count > 0 {
        if queue.first! == shouldFindNumbers.first! {
            pop()
        } else {
            let shouldFindNumberIndex = queue.firstIndex(of: shouldFindNumbers.first!)!
            if round(CGFloat(queue.count)/2) >= CGFloat(shouldFindNumberIndex+1) {
                //moveLeft
                (0..<shouldFindNumberIndex).forEach { _ in
                    moveLeft()
                    result += 1
                }
            } else {
                (0..<queue.count-shouldFindNumberIndex).forEach { _ in
                    moveRight()
                    result += 1
                }
            }
        }
    }
    print(result)
}

solution()
