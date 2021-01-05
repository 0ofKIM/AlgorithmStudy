import Foundation

func solution(_ s:String) -> [Int] {
    
    let startIdx = s.index(s.startIndex, offsetBy: 2) // {{
    let endIdx = s.index(s.endIndex, offsetBy: -2)    // }}
    
    let sets = s[startIdx..<endIdx]
        .components(separatedBy: "},{")
        .map{ $0.components(separatedBy: ",").map{ Int($0)! } }
        .sorted(by: { $0.count < $1.count })
    
    var result: [Int] = []
    
    sets.forEach {
        result += Set($0).subtracting(result)
    }
    
    return result
}
