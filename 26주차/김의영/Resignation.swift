import Foundation

func solution() {
    guard let day = Int(readLine()!) else { return }
    var plan: [(Int, Int)] = []
    var maxReward = [Int](repeating: 0, count: 20)

    for _ in 0..<day {
        if let inputData = readLine()?.split(separator: " ") {
            let duration = Int(inputData[0]) ?? 0
            let reward = Int(inputData[1]) ?? 0
            plan.append((duration, reward))
        }
    }

    for i in 0..<day {
        if maxReward[i] > maxReward[i+1] {
            maxReward[i+1] = maxReward[i]
        }
        if maxReward[i+plan[i].0] < maxReward[i] + plan[i].1 {
            maxReward[i+plan[i].0] = maxReward[i] + plan[i].1
        }
    }

    print(maxReward[day])
}

solution()
