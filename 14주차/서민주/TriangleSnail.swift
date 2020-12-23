import Foundation

func solution(_ n:Int) -> [Int] {
    var result = [Int](repeating: 0, count: n*(n+1)/2)
    
    var (row, col) = (0, 0)
    var distance = 0 // 가장 바깥쪽 삼각형과의 거리
    var num = 1
    
    for side in (1...n).reversed() {
        for i in 0..<side {
            switch (n-side) % 3 {
            case 0:
                if i == 0 {
                    row = distance*2 + i
                    col = distance
                } else {
                    row += 1
                }
            case 1:
                col += 1
            case 2:
                row -= 1; col -= 1
            default:
                break
            }
            result[row*(row+1)/2 + col] = num
            num += 1
        }
        
        if side % 3 == 0 { distance += 1 }
    }
    
    return result
}
