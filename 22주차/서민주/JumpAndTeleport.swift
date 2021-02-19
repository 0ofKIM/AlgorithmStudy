import Foundation

func solution(_ n:Int) -> Int 
{
    var ans:Int = 0
    var n = n
    
    while n > 0 {
        if n % 2 != 0 {
            n -= 1
            ans += 1
        }
        n /= 2
    }
    
    return ans
    // return String(n, radix: 2).reduce(0, { $0 + ($1 == "1" ? 1 : 0) })
}
