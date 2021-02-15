import Foundation

func solution(_ operations:[String]) -> [Int] {
    var q = [Int]()
    
    for op in operations {
        if op.hasPrefix("I") {
            let numIdx = op.index(op.startIndex, offsetBy: 2)
            q.append(Int(op[numIdx...])!)
            
        } else if let num = op == "D 1" ? q.max() : q.min(), let idx = q.index(of: num) {
            q.remove(at: idx)
        }
    }
    
    return [q.max() ?? 0, q.min() ?? 0]
}
