func solution(_ msg:String) -> [Int] {
    var dictionary: [String:Int] = [:]
    let arrayMsg = Array(msg)
    var (w, c) = (0, 1)
    var wordLength = 1
    var result: [Int] = []
    (65...90).enumerated().forEach { (index, value) in
        dictionary.updateValue(index+1, forKey: String(UnicodeScalar(value)))
    }

    while true {
        let word = String(arrayMsg[w..<c])
        
        if dictionary[word] == nil { c -= 1 }
        else {
            result.append(dictionary[word]!)
            
            w = c
            if c < msg.count {
                let nextWord = word + String(arrayMsg[c])
                dictionary.updateValue(dictionary.count+1, forKey: nextWord)
                wordLength = max(wordLength, nextWord.count)
                c = min(c+wordLength+1, msg.count)
            }
            if w >= c { break }
        }
    }
    
    return result
}
