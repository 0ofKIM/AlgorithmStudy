var firstNumber = Int(readLine()!)!
var stars = Array(repeating: Array(repeating: " ", count: firstNumber), count: firstNumber)

func star(_ row: Int, _ col: Int, _ number: Int) {
    if number == 1 {
        stars[row][col] = "*"
        return
    }
    
    let num = number/3
    for i in 0..<3 {
        for j in 0..<3 {
            if i == 1 && j == 1 { continue }
            else { star(i*num+row, j*num+col, num) }
        }
    }
}

star(0, 0, firstNumber)
stars.forEach { print($0.joined()) }
