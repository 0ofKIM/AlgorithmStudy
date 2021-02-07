import Foundation

func solution(_ s:String) -> [Int] {
    var string: String = s
    var result: [Int] = [0, 0]
    
    while string != "1" {
        let oneCount = string.filter { $0 != "0" }.count
        result[1] += string.count - oneCount
        result[0] += 1
        string = String(oneCount, radix: 2)
    }
    
    return result
}
