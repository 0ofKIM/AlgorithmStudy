import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var height = 1
    var width = (brown-4)/2 - height

    while height*width != yellow {
        height += 1
        width -= 1
    }
    
    return [width + 2, height + 2]
}
