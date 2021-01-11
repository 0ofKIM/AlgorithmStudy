import Foundation

func add(_ num1: String, _ num2: String) -> Int { return Int(num1)! + Int(num2)! }
func sub(_ num1: String, _ num2: String) -> Int { return Int(num1)! - Int(num2)! }
func multiple(_ num1: String, _ num2: String) -> Int { return Int(num1)! * Int(num2)! }
func solution(_ expression:String) -> Int64 {
    let signPriorityArray = [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"], ["*", "+", "-"], ["*", "-", "+"]]
    let numberArray = expression.components(separatedBy: ["+", "-", "*"])
    let signArray = Array(expression.filter { !$0.isNumber })
    var result = 0

    for signPriority in signPriorityArray {
        var tempNumberArray = numberArray
        var tempSignArray = signArray

        for sign in signPriority {
            var addIndex = 0

            for (index, sg) in tempSignArray.enumerated() where String(sg) == sign {
                let leftOperand = index-addIndex
                let rightOperand = index-addIndex+1
                switch sg {
                case "+": tempNumberArray[leftOperand] = String(add(tempNumberArray[leftOperand], tempNumberArray[rightOperand]))
                case "-": tempNumberArray[leftOperand] = String(sub(tempNumberArray[leftOperand], tempNumberArray[rightOperand]))
                case "*": tempNumberArray[leftOperand] = String(multiple(tempNumberArray[leftOperand], tempNumberArray[rightOperand]))
                default: break
                }
                tempSignArray.remove(at: index-addIndex)
                tempNumberArray.remove(at: index-addIndex+1)
                addIndex += 1
            }
        }
        result = max(result, abs(Int(tempNumberArray[0])!))
    }

    return Int64(result)
}
