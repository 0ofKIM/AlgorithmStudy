let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var result = ""

func dfs(_ num: Int, _ count: Int, _ sequence: String) {
    guard count < M else { 
        result += "\(sequence)\n"
        return
    }
    guard num <= N else { return }

    for n in num...N {
        dfs(n, count + 1, sequence + "\(n) ")
    }
}

dfs(1, 0, "")
print(result)
