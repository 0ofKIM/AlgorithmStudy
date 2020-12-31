import Foundation

func solution(_ s:String) -> Int{
    
    guard s.count % 2 == 0 else { return 0 }
    
    var stack = [Character]()
    
    s.forEach {
        if let last = stack.last, last == $0 {
            stack.removeLast()
        } else {
            stack.append($0)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}
