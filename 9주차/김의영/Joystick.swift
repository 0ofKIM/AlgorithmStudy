import Foundation

func solution(_ name:String) -> Int {
    var answer = 0
    var requireBack = false
    var aCount = 0
    var storeACount = 0
    var backAlphabetCount = 0
    let alphabets: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let middleIndex = alphabets.firstIndex(of: "N")!

    for (index, alphabet) in name.enumerated() {
        let currentIndex = alphabets.firstIndex(of: String(alphabet))!
        answer += currentIndex <= middleIndex ? currentIndex : 26-currentIndex
        if index != name.count-1 { answer += 1 }

        if alphabet == "A" && index+1 < name.count {
            aCount += 1
            if name[name.index(name.startIndex, offsetBy: index+1)] != "A" {
                if aCount >= index - aCount {
                    storeACount = aCount
                    backAlphabetCount = index - aCount
                    requireBack = true
                }
                aCount = 0
            }
        }
    }

    return requireBack ? answer - (storeACount - backAlphabetCount) : answer
}
