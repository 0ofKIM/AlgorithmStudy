let N = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }
var opCounter = readLine()!.split(separator: " ").map{ Int(String($0))! }

var (max, min) = (Int.min, Int.max)

func calc(_ num1: Int, _ num2: Int, _ opIdx: Int) -> Int {
    var result = 0

    switch opIdx {
    case 0: result = num1 + num2
    case 1: result = num1 - num2
    case 2: result = num1 * num2
    case 3: result = num1 / num2
    default: ()
    }
    return result
}

func dfs(_ numIdx: Int, _ result: Int) {
    guard numIdx < N else {
        if result > max { max = result }
        if result < min { min = result }
        return
    }

    for (opIdx, count) in opCounter.enumerated() where count > 0 {
        opCounter[opIdx] -= 1
        dfs(numIdx+1, calc(result, nums[numIdx], opIdx))
        opCounter[opIdx] += 1
    }
}

dfs(1, nums[0])
print(max, min, separator: "\n")
