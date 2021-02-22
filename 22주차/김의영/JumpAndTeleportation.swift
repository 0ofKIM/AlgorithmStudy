import Foundation

func solution(_ n:Int) -> Int
{
    var (number, result) = (n, 0)
    
    while number > 0 {
        if number%2 == 1 { result += 1 }
        number /= 2
    }

    return result
}
