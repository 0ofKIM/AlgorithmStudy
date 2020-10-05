import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var closet = [String : Int]()
    var result = 1

    clothes.forEach {
        closet[$0[1]] = (closet[$0[1]] ?? 0) + 1
    }
    closet.values.forEach {
        result *= $0 + 1
    }

    return result - 1
}
