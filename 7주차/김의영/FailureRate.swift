import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureArray: [Int] = Array(repeating: 0, count: N) //실패자 수
    var failureTuple: [(Double, Int)] = Array(repeating: (0,0), count: N) //(실패율, 스테이지)
    var answer: [Int] = []
    
    for i in 0..<stages.count {
        let stageIndex = stages[i] - 1
        if stageIndex < N {
            failureArray[stageIndex] += 1
        }
    }
    
    var stagesCount = stages.count
    for i in 0..<N {
        failureTuple[i].0 = failureArray[i] > 0 ? Double(failureArray[i]) / Double(stagesCount) : 0
        failureTuple[i].1 = i+1
        stagesCount -= failureArray[i]
    }
    
    for stage in failureTuple.sorted(by: { $0.0 > $1.0 }) {
        answer.append(stage.1)
    }
    return answer
}
