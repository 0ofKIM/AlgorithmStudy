func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        var firstArr = String(arr1[i], radix: 2)
        var secondArr = String(arr2[i], radix: 2)
        for _ in 0..<(n-firstArr.count) { firstArr.insert("0", at: firstArr.startIndex) }
        for _ in 0..<(n-secondArr.count) { secondArr.insert("0", at: secondArr.startIndex) }

        var str = ""
        for j in 0..<n {
            let isEmptySpace = (firstArr[firstArr.index(firstArr.startIndex, offsetBy: j)] == "0") && (secondArr[secondArr.index(secondArr.startIndex, offsetBy: j)] == "0")
            str.append(isEmptySpace ? " " : "#")
        }
        answer.append(str)
    }

    return answer
}
