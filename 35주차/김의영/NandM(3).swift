let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var resultString = ""

func solution(_ numberArray: [Int], _ numberString: String) {
    guard numberArray.count < m else {
        resultString += numberString + "\n"
        return
    }

    for i in 1...n {
        solution(numberArray+[i], "\(numberString)\(i) ")
    }
}

solution([], "")
print(resultString)
