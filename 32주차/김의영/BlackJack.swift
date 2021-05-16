let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let cards = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted()

func solution() -> Int {
    var max: Int = 0
    
    for firstCardIndex in 0..<n {
        for secondCardIndex in firstCardIndex+1..<n {
            for thirdCardIndex in secondCardIndex+1..<n {
                let totalValue = cards[firstCardIndex] + cards[secondCardIndex] + cards[thirdCardIndex]
                
                switch m-totalValue {
                case 0:
                    return totalValue
                case ...0:
                    continue
                case 0...:
                    if max < totalValue { max = totalValue }
                default:
                    break
                }
            }
        }
    }
    
    return max
}

print(solution())
