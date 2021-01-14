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
        partialStringTuple.map { resultString.append("\($0.1 == 1 ? "" : String($0.1))\($0.0)") }
        resultArray.append(resultString)
    }

    return resultArray.sorted { $0.count < $1.count }[0].count
}
