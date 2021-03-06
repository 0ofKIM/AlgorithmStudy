import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    if !words.contains(target) { return 0 }
    
    var answer = 0
    var words = words
    var stack = [begin]
    
    while !stack.isEmpty {
        var w = stack.removeLast()
        var matches = [String]()
        
        for i in 0..<w.count {
            for word in words where word.prefix(i) == w.prefix(i) && word.dropFirst(i + 1) == w.dropFirst(i + 1) {
                matches.append(word)
            }
        }
        
        if !matches.isEmpty { 
            answer += 1 
            if matches.contains(target) { return answer }
            words = words.filter { !matches.contains($0) }
            stack += matches
        }
    }
    
    return 0
}
