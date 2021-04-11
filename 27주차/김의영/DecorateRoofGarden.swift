import Foundation

func solution() {
    guard let buildingCount = Int(readLine() ?? "") else { return }
    let buildingHeight: [Int] = (0..<buildingCount).map { _ in Int(readLine()!)! }
    var stack: [Int] = []
    var result: Int = 0
    
    for i in 0..<buildingCount {
        while(!stack.isEmpty && stack.last! <= buildingHeight[i] ) {
            stack.removeLast()
        }
        
        stack.append(buildingHeight[i])
        result += stack.count-1
    }
    
    print(result)
}

solution()
