let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

func solution(_ numberArray: [Int]) {
    guard numberArray.count < m else {
        var numberArrayString = ""
        numberArray.enumerated().forEach { (index, number) in
            numberArrayString.append(index == 0 ? "\(number)" : " \(number)" )
        }
        print(numberArrayString)
        return
    }
    
    for i in 1...n where !numberArray.contains(i) {
        solution(numberArray+[i])
    }
}

solution([i])
