func contains666(_ num: Int) -> Bool {
    var tmpNum = num

    while tmpNum >= 666 {
        if (tmpNum - 666) % 1000 == 0 { return true }
        tmpNum /= 10
    }
    return false
}

if let N = Int(readLine()!) {
    var (num, count) = (666, 1)

    while count < N {
        num += 1
        if contains666(num) { count += 1 }
    }
    print(num)
}
