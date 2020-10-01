import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var closet = [String : [String]]()
    var result = 1
    
    clothes.forEach {
        closet[$0[1]] = (closet[$0[1]] ?? []) + [$0[0]]
    }
    closet.values.forEach {
        result *= $0.count + 1
    }

    return result - 1
}
