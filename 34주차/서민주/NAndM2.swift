let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (NM[0], NM[1])

func dfs(_ num: Int, _ sequence: [Int]) {
    guard sequence.count < M else { 
        sequence.forEach { print($0, terminator: " ") }
        print()
        return
    }
    guard num <= N else { return }

    for n in num...N {
        dfs(n+1, sequence + [n])
    }
}

dfs(1, [])
