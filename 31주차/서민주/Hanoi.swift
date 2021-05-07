if let N = Int(readLine()!) {
    var (count, result) = (0, "")
    
    func move(_ from: Int, _ to: Int) {
        count += 1
        result += "\n\(from) \(to)"
    }

    func hanoi(_ n: Int, _ from: Int, _ via: Int, _ to: Int) {
        guard n > 1 else {
            move(from, to)        
            return
        }

        hanoi(n-1, from, to, via)
        move(from, to)
        hanoi(n-1, via, from, to)
    }

    hanoi(N, 1, 2, 3)
    print(count, result)
}
