let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (NM[0], NM[1])

func dfs(_ sequence: [Int]) {
    guard sequence.count < M else { 
        sequence.forEach { print($0, terminator: " ") }
        print()
        return
    }

    for n in 1...N where !sequence.contains(n) {
        dfs(sequence + [n])
    }
}

dfs([])
