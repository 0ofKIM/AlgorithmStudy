import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var printTuple: [(Int, Int)] = []
    for i in 0...priorities.count-1 {
        printTuple.append((i, priorities[i])) //(문서,중요도)
    }

    var nextDocument = stackQueue(printTuple, maxPriority(printTuple))
    var answer = 0
    while true {
        answer += 1
        if printTuple[location].0 == nextDocument[0].0 {
            return answer
        } else {
            nextDocument.removeFirst()
            nextDocument = stackQueue(nextDocument, maxPriority(nextDocument))
        }
    }
}

func stackQueue(_ priorities: [(Int, Int)], _ maxPriority: Int) -> [(Int, Int)] {
    var array = priorities

    while array[0].1 != maxPriority {
        array.append(array[0])
        array.removeFirst()
    }

    return array
}

func maxPriority(_ array: [(Int, Int)]) -> Int{
    var priorityArray: [Int] = []

    for i in 0...array.count-1 {
        priorityArray.append(array[i].1)
    }

    return priorityArray.max()!
}
