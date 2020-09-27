import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    commands.forEach {
        let temp = array[$0[0]-1...$0[1]-1].sorted()
        result.append(temp[$0[2]-1])
    }
    return result
}
