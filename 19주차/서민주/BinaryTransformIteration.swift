import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var (cvCnt, rmCnt) = (0, 0)
    
    while s != "1" {
        let removed = s.filter{$0 != "0"}.count
        cvCnt += 1
        rmCnt += s.count-removed
        
        s = String(removed, radix: 2)
    }
    return [cvCnt, rmCnt]
}
