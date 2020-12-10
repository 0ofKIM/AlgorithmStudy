import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {

    var lastLetter: Character = words[0].first!
    
    for (index, word) in words.enumerated() {
        if word.count == 1 || words[..<index].contains(word) || word.first! != lastLetter {
            return [index % n + 1, index / n + 1]
        }
        lastLetter = word.last!
    }
    
    return [0, 0]
}
