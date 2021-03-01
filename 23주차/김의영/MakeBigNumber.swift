func solution(_ number:String, _ k:Int) -> String {
    let numberArray = number.map { Int(String($0))! }
    var copiedK = k
    var nextIndex = 0
    var result = ""

    for _ in 0..<number.count-k {
        var maxValue = 0
        var maxIndex = 0

        for (index, number) in numberArray[nextIndex...copiedK].enumerated() {
            if number > maxValue && number != 0 {
                maxValue = number
                maxIndex = index
                if maxValue == 9 { break }
            }
        }
        nextIndex += maxIndex+1
        result.append("\(maxValue)")
        copiedK += 1
    }

    return result
}
