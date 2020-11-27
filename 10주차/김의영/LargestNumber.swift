import Foundation

func solution(_ numbers:[Int]) -> String {
    let answer = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }

    return answer.first == 0 ? "0" : answer.reduce("") { String($0) + String($1) }
}
