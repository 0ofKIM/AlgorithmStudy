let N = Int(readLine()!)!

var schedule: [(Int, Int)] = (0..<N).map { _ in 
    let input = readLine()!.split(separator: " ")
    return (Int(input[0])!, Int(input[1])!)
}
var profits = [Int](repeating: 0, count: N+1)

for i in stride(from: N-1, through: 0, by: -1) {
    let next = i + schedule[i].0
    profits[i] = next <= N ? max(profits[i+1], schedule[i].1 + profits[next]) : profits[i+1]
}
print(profits[0])
