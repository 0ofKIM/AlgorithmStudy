import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var answer = 0
    var currentLocation = location
    var priorityQueue = priorities
    var priorityDict = priorities.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 }
    
    while !priorityQueue.isEmpty {
        let doc = priorityQueue[0]
        
        if priorityDict.keys.filter({ $0 > doc }).count > 0 {
            priorityQueue.removeFirst()
            priorityQueue.append(doc)
            if currentLocation == 0 {
                currentLocation = priorityQueue.count
            }
        } else {
            answer += 1
            priorityQueue.removeFirst()
            if priorityDict[doc] == 1 { priorityDict[doc] = nil }
            else { priorityDict[doc]! -= 1 }
            if currentLocation == 0 { return answer }
        }
        currentLocation -= 1
    }
    
    return answer
}
