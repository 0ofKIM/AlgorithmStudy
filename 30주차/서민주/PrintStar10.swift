func drawPattern(_ n: Int, _ pattern: [String]) {
    guard n > 1 else {
        pattern.forEach { print($0) }
        return
    }

    let row1 = pattern.map { String(repeating: $0, count: 3) }
    let row2 = pattern.map { $0 + String(repeating: " ", count: pattern.count) + $0 }
    let newPattern = row1 + row2 + row1

    drawPattern(n/3, newPattern)
}

if let n = Int(readLine()!) {
    drawPattern(n, ["*"])
}
