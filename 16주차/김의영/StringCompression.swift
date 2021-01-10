import Foundation

func solution(_ s:String) -> Int {
    guard s.count/2 != 0 else { return 1 }
    let halfCount = s.count/2
    var resultArray: [String] = []

    for divisionNumber in 1...halfCount {
        var partialStringTuple: [(String, Int)] = []
        var tupleIndex = 0

        for index in stride(from: 0, to: s.count, by: divisionNumber) {
            let startIndex = s.index(s.startIndex, offsetBy: index)
            let endIndex = s.index(s.startIndex, offsetBy: index+divisionNumber > s.count ? s.count-1 : index+divisionNumber-1 )
            let partialString = String(s[startIndex...endIndex])

            if partialStringTuple.count == 0 {
                partialStringTuple.append((partialString,1))
            } else if partialStringTuple[tupleIndex].0 == partialString {
                partialStringTuple[tupleIndex].1 += 1
            } else {
                partialStringTuple.append((partialString,1))
                tupleIndex += 1
            }
        }

        var resultString = ""
        for tuple in partialStringTuple {
            resultString.append("\(tuple.1 == 1 ? "" : String(tuple.1))\(tuple.0)")
        }
        resultArray.append(resultString)
    }

    var result = 99999999
    for rs in resultArray {
        result = rs.count < result ? rs.count : result
    }

    return result
}
