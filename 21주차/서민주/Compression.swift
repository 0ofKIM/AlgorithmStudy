func solution(_ msg:String) -> [Int] {
    let msgLen = msg.count
    let msgArr = Array(msg)
    let AtoZ = (65...90).map({ String(UnicodeScalar($0)) })
    
    var result = [Int]()
    var dict = [String: Int]()
    AtoZ.enumerated().forEach { (idx, alpha) in dict[alpha] = idx + 1 }
    
    func getIndex(_ l: Int, _ r: Int) -> Int? {
        return dict[String(msgArr[l...r])]
    }
    
    var (l, r, lastIdx) = (0, 0, 27)
    
    while l < msgLen {
        while r < msgLen && getIndex(l, r) != nil { r += 1 }
        result.append(getIndex(l, r-1)!)
        
        if r < msgLen {
            dict[String(msgArr[l...r])] = lastIdx
            lastIdx += 1
        }
        
        l = r
    }
    
    return result
}
