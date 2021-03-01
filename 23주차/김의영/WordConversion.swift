func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }

    var isCheck = Array(repeating: false, count: words.count)
    var result = Int.max
    func dfs(_ start: String, _ changCount: Int) {
        if start == target {
            result = min(result, changCount)
            return
        }

        for (index, word) in words.enumerated() {
            if !isCheck[index] && zip(start,word).filter({ $0 != $1 }).count == 1  {
                isCheck[index] = true
                dfs(word, changCount+1)
                isCheck[index] = false
            }
        }
    }

    dfs(begin, 0)

    return result
}
