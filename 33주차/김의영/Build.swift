import Foundation

func solution() {
    let count = Int(readLine()!)!
    var builds: [(Int, Int)] = []
    for _ in 0..<count {
        let build = readLine()?.components(separatedBy: " ")
        builds.append((Int(build![0])!, Int(build![1])!))
    }
    var resultString = ""
    
    for i in 0..<count {
        var rank = 1
        for j in 0..<count where (j != i) && (builds[i].0 < builds[j].0) && (builds[i].1 < builds[j].1) {
            rank += 1
        }
        
        resultString.append(i == 0 ? "\(rank)" : " \(rank)")
    }
    
    print(resultString)
}

solution()
