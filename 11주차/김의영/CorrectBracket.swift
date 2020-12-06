import Foundation

func solution(_ s:String) -> Bool
{
    var open = 0

    for bracket in s {
        if bracket == "(" { open += 1 }
        else if bracket == ")" {
            if open == 0 { return false }
            else if open > 0 { open -= 1 }
        }
    }

    return open == 0 ? true : false
}
