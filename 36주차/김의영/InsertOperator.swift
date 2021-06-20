func solution(_ index: Int, _ result: Int, _ add: Int, _ sub: Int, _ mul: Int, _ div: Int) {
    if index == n-1 {
        if result < minimumResult { minimumResult = result }
        if result > maximumResult { maximumResult = result }
    }

    if add > 0 { solution(index+1, result+numbers[index+1], add-1, sub, mul, div) }
    if sub > 0 { solution(index+1, result-numbers[index+1], add, sub-1, mul, div) }
    if mul > 0 { solution(index+1, result*numbers[index+1], add, sub, mul-1, div) }
    if div > 0 { solution(index+1, result/numbers[index+1], add, sub, mul, div-1) }
}

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let operators = readLine()!.split(separator: " ").map { Int(String($0))! }
var maximumResult = Int.min
var minimumResult = Int.max

solution(0, numbers[0], operators[0], operators[1], operators[2], operators[3])
print(maximumResult)
print(minimumResult)
