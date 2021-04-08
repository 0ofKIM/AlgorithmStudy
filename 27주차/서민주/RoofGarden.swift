let N = Int(readLine()!)!
let H = (0..<N).map({ _ in Int(readLine()!)! })

var stack = [Int]()
var result = 0
for i in 0..<N {
    while let height = stack.last, height <= H[i] {
        stack.removeLast()
    }
    result += stack.count
    stack.append(H[i])
}
print(result)

