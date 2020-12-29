import Foundation

func solution(_ dartResult:String) -> Int {
    var score: [Int] = []

    for dart in dartResult {
        let index = score.count > 0 ? score.count-1 : 0

        switch String(dart) {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if dart == "0" && score.count > 0 && score[index] == 1 {
                score[index] = 10
            } else {
                score.append(Int(String(dart))!)
            }
        case "*":
            score[index] = score[index] * 2
            if score.count > 1 { score[index-1] = score[index-1] * 2 }
        case "#":
            score[index] = score[index] * (-1)
        case "D", "T":
            score[index] = dart == "D" ? Int(pow(Double(score[index]), 2.0)) : Int(pow(Double(score[index]), 3.0))
        default: break
        }
    }

    return score.reduce(0) { $0 + $1 }
}
