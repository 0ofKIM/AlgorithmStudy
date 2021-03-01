import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var answer = [Character]()
    var len = number.count
    var k = k
    
    for (i, n) in number.enumerated() {
        while let last = answer.last, last < n && k > 0 {
            answer.removeLast()
            k -= 1
        }
        
        if k == 0 {
            answer += number.suffix(len - i) 
            break
        }
        answer.append(n)
    }

    return answer.prefix(len-k).reduce("", { $0 + String($1) })
}
