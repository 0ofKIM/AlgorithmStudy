func fibonacci(_ number: Int) -> Int {
    guard number > 1 else { return number }

    return fibonacci(number-2) + fibonacci(number-1)
}

let number = Int(readLine()!)!
print(fibonacci(number))
