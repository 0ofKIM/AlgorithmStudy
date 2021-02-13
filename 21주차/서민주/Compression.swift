func solution(_ msg:String) -> [Int] {
    let AtoZ = (65...90).map({String(UnicodeScalar($0))})
    
    var dict = [""] + AtoZ
    var msgArr = Array(msg)
    var result = [Int]()
    
    var (front, back) = (0, 1)
    var maxLen = 1
    
    while front<back && back <= msg.count {
        let word = String(msgArr[front..<back])
        
        if let index = dict.firstIndex(of: word) {
            result.append(index)
            front = back
            if back < msg.count { 
                let newWord = word + String(msgArr[back])
                
                dict.append(newWord)
                maxLen = max(maxLen, newWord.count)
                back = min(back + maxLen + 1, msg.count)
            }
        } else { back -= 1 }
    }
    
    return result
}
