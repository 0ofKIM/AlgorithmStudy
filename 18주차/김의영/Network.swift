func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var linked: [Int] = Array(repeating: 0, count: n)
    var networkCount = 0
    func dfs(_ link:[Int]) {
        for (index, vertex) in link.enumerated() where vertex == 1 && linked[index] == 0 {
            linked[index] = 1
            dfs(computers[index])
        }
    }
    
    for (i, link) in computers.enumerated() {
        if linked[i] == 0 {
            dfs(link)
            networkCount += 1
        }
    }

    return networkCount
}
