import Foundation

func solution(_ s:String) -> Bool
{
    var sum = 0
        
    for bracket in s {
        sum += bracket == "(" ? 1 : -1
        if sum < 0 {
            return false
        }
    }

    return sum == 0
}
