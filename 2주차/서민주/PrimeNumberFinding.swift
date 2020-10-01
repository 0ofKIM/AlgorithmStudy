import Foundation

func solution(_ n:Int) -> Int {
    
    if n == 2 {
        return 1
    }
    
    var prime = Array(repeating: true, count: n+1)
    
    prime[0] = false
    prime[1] = false
    
    let m = Int(sqrt(Double(n)))
    
    for i in 2...m {
        if prime[i] {
            for j in stride(from: i+i, through: n,  by: i) {
                prime[j] = false
            }
        }
    }
    return prime.filter{$0}.count
}
