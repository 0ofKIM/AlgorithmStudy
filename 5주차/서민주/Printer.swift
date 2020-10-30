import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var answer = 0
    var currentLocation = location
    var priorityQueue = priorities
    
    while !priorityQueue.isEmpty {
        let doc = priorityQueue[0]
        
        if priorityQueue.contains(where: { $0 > doc }) {
            priorityQueue.removeFirst()
            priorityQueue.append(doc)
            if currentLocation == 0 {
                currentLocation = priorityQueue.count
            }
        } else {
            answer += 1
            priorityQueue.removeFirst()
            if currentLocation == 0 { return answer }
        }
        currentLocation -= 1
    }
    
    return answer
}
