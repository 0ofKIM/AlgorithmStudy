if let n = Int(readLine()!) {
    var stars = Array(repeating: Array(repeating: " ", count: n), count: n)

    func fillStar(_ x: Int, _ y: Int) {
        for i in 0..<3 {
            for j in 0..<3 {
                stars[x+i][y+j] = i == 1 && j == 1 ? " " : "*"
            }
        }
    }

    func fillSpace(_ x: Int, _ y: Int) {
        for i in 0..<3 {
            for j in 0..<3 {
                stars[x+i][y+j] = " "
            }
        }
    }

    func divideSquare(_ size: Int, _ x: Int, _ y: Int, _ space: Bool) {
        guard size > 3 else {
            if space { fillSpace(x, y) }
            else { fillStar(x, y) }
            return
        }

        let size = size/3
        for i in 0..<9 {
            divideSquare(size, x + (i % 3 * size), y + (i / 3 * size), i == 4 || space)
        }
    }
    divideSquare(n, 0, 0, false)
    stars.forEach { print($0.joined()) }
}
