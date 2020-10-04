import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothType: [String : Int] = [:]
    var answer = 1
    
    for cloth in clothes {
        let index = clothType.index(forKey: cloth.last!)

        if clothType.keys.contains(cloth.last!) {
            clothType[clothType[index!].key]! += 1
        } else {
            clothType.updateValue(1, forKey: cloth.last!)
        }
    }
    
    for cloth in clothType {
        answer *= (cloth.value+1)
    }

    return answer-1
}
