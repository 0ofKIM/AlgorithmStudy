import Foundation

func solution(_ land:[[Int]]) -> Int{
    var sum = land
    
    for rowIdx in 1..<sum.count {
        sum[rowIdx][0] += max(sum[rowIdx-1][1], sum[rowIdx-1][2], sum[rowIdx-1][3])
        sum[rowIdx][1] += max(sum[rowIdx-1][0], sum[rowIdx-1][2], sum[rowIdx-1][3])
        sum[rowIdx][2] += max(sum[rowIdx-1][0], sum[rowIdx-1][1], sum[rowIdx-1][3])
        sum[rowIdx][3] += max(sum[rowIdx-1][0], sum[rowIdx-1][1], sum[rowIdx-1][2])
    }
    
    return (sum.last?.max())!
}
