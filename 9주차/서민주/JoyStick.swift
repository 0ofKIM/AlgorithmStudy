import Foundation

func solution(_ name:String) -> Int {
    
    let asciiOfA = Character("A").asciiValue!
    var answer = 0
    for char in name {
        if char != "A" { 
            let ascii = char.asciiValue!
            answer += Int(min(ascii - asciiOfA, 26 + asciiOfA - ascii))
        }
    }
    
    let len = name.count
    var move = len - 1
    for i in 0..<len {
        var next = i + 1
        while next < len && name[name.index(name.startIndex, offsetBy: next)] == "A" { 
            next += 1 
        }
        move = min(move, i + len - next + min(i, len - next))
    }
    answer += move
    
    return answer
}
