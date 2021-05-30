let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

func solution(_ numberArray: [Int], _ number: Int) {
    guard numberArray.count < m else {
        var numberArrayString = ""
        numberArray.enumerated().forEach { (index, number) in
            numberArrayString.append(index == 0 ? "\(number)" : " \(number)" )
        }
        print(numberArrayString)
        return
    }
    guard number <= n else { return }
        
    for i in number...n where !numberArray.contains(i) {
        solution(numberArray+[i], i+1)
    }
}

solution([], 1)
