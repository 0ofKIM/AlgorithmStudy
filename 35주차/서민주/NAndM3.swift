let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var result = ""

func dfs(_ count: Int, _ sequence: String) {
    guard count < M else { 
        result += "\(sequence)\n"
        return
    }

    for n in 1...N {
        dfs(count + 1, sequence + "\(n) ")
    }
}

dfs(0, "")
print(result)
