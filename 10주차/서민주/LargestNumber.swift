import Foundation

func solution(_ numbers:[Int]) -> String {
    var answer = numbers.map({String($0)}).sorted{ $0+$1 > $1+$0 }
    return answer[0] == "0" ? "0" : answer.reduce("", {$0 + $1}) 
}
