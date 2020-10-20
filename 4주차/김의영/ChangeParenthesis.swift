import Foundation

func solution(_ p:String) -> String {
    guard !p.isEmpty else { return "" }

    var u = ""
    var v = ""
    var correct = 0

    for (index, text) in p.enumerated() {
        u.append(text)
        correct += (text == "(") ? 1 : -1
        if correct == 0 {
            v = String(p[p.index(p.startIndex, offsetBy: index+1)...])

            if u.last == ")" {
                u.append(solution(v))

                return u
            } else {
                u.removeFirst()
                u.removeLast()

                return "(" + solution(v) + ")" + u.map { $0 == "(" ? ")" : "(" }
            }
        }
    }

    return ""
}
