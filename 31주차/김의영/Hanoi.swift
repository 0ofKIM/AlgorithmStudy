import Foundation

var isOverTwenty = false
func hanoi(_ number: Int, _ first: Int, _ middle: Int, _ last: Int) {
    guard number > 1 else {
        if !isOverTwenty { print("\(first) \(last)") }
        return
    }

    hanoi(number-1, first, last, middle)
    if !isOverTwenty { print("\(first) \(last)") }
    hanoi(number-1, middle, first, last)
}

if let number = Int(readLine()!) {
    var result = 1
    for _ in 0..<number {
        result *= 2
    }

    isOverTwenty = number > 20
    print("\(result-1)")
    hanoi(number, 1, 2, 3)
}
