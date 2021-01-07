import Foundation

func solution(_ s: String) -> Int {
    guard s.count%2 == 0 else { return 0 }
    var alphabetStack: String = ""

    s.forEach { currentAlphabet in
        if alphabetStack.isEmpty || alphabetStack.last != currentAlphabet {
            alphabetStack.append(currentAlphabet)
        } else {
            alphabetStack.removeLast()
        }
    }

    return alphabetStack.isEmpty ? 1 : 0
}
