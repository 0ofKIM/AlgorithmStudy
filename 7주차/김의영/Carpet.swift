import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var height = 3
    var width = (brown+yellow)/height
    
    while (width-2) * (height-2) != yellow {
        height += 1
        width = (brown+yellow)/height
    }
    
    return [width,height]
}
