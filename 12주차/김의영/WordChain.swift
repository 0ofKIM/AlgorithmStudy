import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var usedWords: [String] = []
    var endChar: Character = " "
    for (index, word) in words.enumerated() {
        if (index > 0 && endChar != word.first) || usedWords.contains(word) {
            return [(index%n)+1, (index/n)+1]
        }

        endChar = word.last!
        usedWords.append(word)
    }

    return [0, 0]
}
