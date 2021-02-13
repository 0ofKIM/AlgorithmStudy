import Foundation

func solution(_ operations:[String]) -> [Int] {
    var q = [Int]()
    var (min, max) = (0, 0)
    
    for op in operations {
        let separated = op.components(separatedBy: " ")
        let (command, num) = (separated[0], Int(separated[1])!)
        
        if command == "I" {
            q.append(num)
        } else if num == 1 {
            if let maxNum = q.max(), let maxIdx = q.index(of: maxNum) {
                q.remove(at: maxIdx)    
            }
        } else if num == -1 {
            if let minNum = q.min(), let minIdx = q.index(of: minNum) {
                q.remove(at: minIdx)    
            }
        }
    }
    
    return [q.max() ?? 0, q.min() ?? 0]
}
