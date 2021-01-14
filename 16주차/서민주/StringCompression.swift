import Foundation

func solution(_ s:String) -> Int {
    guard s.count > 2 else { return s.count }
    var sArr = Array(s)
    var min = s.count
    
    func compress(_ tokenLength: Int) -> Int {
        var words = [ArraySlice<Character>]()
        for i in stride(from: 0, through: s.count-tokenLength, by: tokenLength) {
            words.append(sArr[i..<i+tokenLength])
        }
        words.append(ArraySlice<Character>())
        
        var compressedLength = s.count % tokenLength
        var (word, cnt) = (words[0], 1)
        for (front, back) in zip(words, words[1...]) {
            if front == back {
                cnt += 1
            }
            else {
                compressedLength += (cnt == 1 ? 0 : cnt < 10 ? 1 : 2) + word.count
                (word, cnt) = (back, 1)
            }
        }
        return compressedLength
    }
    
    for tokenLength in (1...s.count/2).reversed() {
        let res = compress(tokenLength)
        if res < min { min = res }
    }
    
    return min
}
