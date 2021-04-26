import Foundation

func solution() -> Int {
    let number = Int(String(readLine()!))!
    guard number > 0 else { return 1 }

    return (1...number).reduce(1,*)
}

print(solution())
