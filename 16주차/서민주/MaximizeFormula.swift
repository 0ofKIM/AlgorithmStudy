import Foundation

func solution(_ expression:String) -> Int64 {
    
    let priors: [[Character]] = [["+", "-", "*"], ["+", "*", "-"],
                                 ["-", "+", "*"], ["-", "*", "+"],
                                 ["*", "-", "+"], ["*", "+", "-"]]
    
    let operands = expression.components(separatedBy: ["+", "-", "*"]).map { Int($0)! }
    let operators = Array(expression.filter { !$0.isNumber })

    var result = 0
    
    func calc(_ a: Int, _ b: Int, _ op: Character) -> Int {
        switch op {
        case "+": return a + b
        case "-": return a - b
        case "*": return a * b
        default:  return 0
        }
    }
    
    for prior in priors {
        var (opds, opts) = (operands, operators)
            
        for op in prior {
            while let index = opts.firstIndex(of: op) {
                opds[index] = calc(opds[index], opds[index+1], opts[index])
                opds.remove(at: index+1)
                opts.remove(at: index)
            }
        }
        result = max(result, abs(opds[0]))
    }
    
    return Int64(result)
}
