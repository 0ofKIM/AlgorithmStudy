import Foundation

func solution(_ operations:[String]) -> [Int] {
    var array: [Int] = []
    
    operations.forEach {
        let splited = $0.split(separator: " ")
        let (operation, number) = (splited[0], Int(splited[1])!)
        
        if operation == "I" {
            array.append(number)
        } else {
            if let value = number == 1 ? array.max() : array.min(), let index = array.firstIndex(of: value) {
                array.remove(at: index)
            }
        }
    }
    
    return [array.max() ?? 0, array.min() ?? 0]
}
