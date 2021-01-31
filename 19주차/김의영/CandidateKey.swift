import Foundation

func solution(_ relation:[[String]]) -> Int {
    let tupleCount = relation.count
    let attributeCount = relation[0].count
    var resultArray: [Int] = []

    for i in 1..<(1<<attributeCount) {
        var set: Set<String> = []

        for tuple in 0..<tupleCount {
            var tempString = ""

            for attribute in 0..<attributeCount where (i & (1<<attribute)) != 0 {
                tempString += relation[tuple][attribute]
            }

            set.insert(tempString)
        }

        if set.count == tupleCount {
            var isContain = true

            for result in resultArray where (result&i) == result {
                isContain = false
                break
            }

            if isContain { resultArray.append(i) }
        }
    }

    return resultArray.count
}
//https://www.youtube.com/watch?v=XkmOD7chow8
