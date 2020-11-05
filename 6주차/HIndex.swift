import Foundation

func solution(_ citations:[Int]) -> Int {
    for (index, citation) in citations.sorted(by: >).enumerated() {
        if index >= citation { return index }
    }

    return citations.count
}
