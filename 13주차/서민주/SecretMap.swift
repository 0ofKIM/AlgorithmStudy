func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    func convertBinary(_ num: Int) -> String {
        let str = String(num, radix: 2)
        return String(repeating: "0", count: n - str.count) + str
    }
    
    for (first, second) in zip(arr1, arr2) {
        let row1 = convertBinary(first)
        let row2 = convertBinary(second)

        var originRow = ""
        for (cell1, cell2) in zip(row1, row2) {
            originRow += (cell1 == "1" || cell2 == "1") ? "#" : " "
        }
        answer.append(originRow)
    }
    
    return answer
}
