import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var usedWords: [String] = []
    var endChar: Character = " "
    for (index, word) in words.enumerated() {
        if (index > 0 && endChar != word.first) || usedWords.contains(word) {
            return [(index+1)%n == 0 ? n : (index+1)%n, (index+1)%n == 0 ? (index+1)/n : (index+1)/n + 1]
        }

        endChar = word.last!
        usedWords.append(word)
    }

    return [0, 0]
}
