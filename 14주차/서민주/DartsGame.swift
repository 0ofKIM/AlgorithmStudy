func solution(_ dartResult:String) -> Int {
    var scores = [Int](repeating: 0, count: 3)
    var idx = -1
    
    dartResult.forEach {
        switch $0 {
        case "S": break
            
        case "D":
            scores[idx] = scores[idx] * scores[idx]
            
        case "T":
            scores[idx] = scores[idx] * scores[idx] * scores[idx]
            
        case "*":
            if idx > 0 { scores[idx-1] = scores[idx-1] * 2 }
            scores[idx] = scores[idx] * 2
            
        case "#":
            scores[idx] = -scores[idx]
            
        default:
            if let score = Int(String($0)) {
                
                if idx >= 0 && score == 0 && scores[idx] == 1 {
                    scores[idx] = 10
                    break
                }
                idx += 1
                scores[idx] = score
            }
        }
    }

    return scores.reduce(0, +)
}
