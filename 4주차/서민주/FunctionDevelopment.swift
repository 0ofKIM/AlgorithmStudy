import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer = [Int]()
    var first = 0
    var firstWorkEnd = ceil((100.0 - Double(progresses[0])) / Double(speeds[0]))
    
    for index in 1..<progresses.count {
        let workEnd = ceil((100.0 - Double(progresses[index])) / Double(speeds[index]))
        if firstWorkEnd >= workEnd { continue }
        
        answer.append(index - first)
        first = index
        firstWorkEnd = workEnd
    }
    answer.append(progresses.count - first)
    
    return answer
}
