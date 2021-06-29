func solution() {
    let n = Int(readLine()!)!
    let abilities = (0..<n).map { _ in 
        readLine()!.split(separator: " ").map { Int(String($0))! } 
    }
    var min = Int.max
    
    func calcTeamAbility(_ team: [Int]) -> Int {
        var sum = 0

        for i in 0..<team.count {
            for j in 0..<i {
                sum += abilities[team[i]][team[j]] + abilities[team[j]][team[i]]
            }
        }
        return sum
    }

    func dfs(_ num: Int, _ start: [Int], _ link: [Int]) {
        guard start.count < n / 2 || link.count < n / 2 else {
            let startSum = calcTeamAbility(start)
            let linkSum = calcTeamAbility(link)

            let diff = abs(startSum - linkSum)
            if diff < min { min = diff }
            return
        }

        if start.count < n / 2 {
            dfs(num + 1, start + [num], link)            
        }
        if link.count < n / 2 {
            dfs(num + 1, start, link + [num])
        }
    }
    
    dfs(0, [], [])
    
    print(min)
}

solution()
