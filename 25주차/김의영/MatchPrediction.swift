import Foundation

let team = readLine()!.components(separatedBy: " ")
var gameResult = (0...5).map { _ in readLine()!.components(separatedBy: " ") }
var scoreDic: [String:Int] = [:]
var winningAverageDic: [String:Double] = [:]
for i in 0...3 {
    scoreDic[team[i]] = 0
    winningAverageDic[team[i]] = 0.0
}

func play(_ sequence: Int, _ winningAverage: Double) {
    guard winningAverage > 0 else { return }
    if sequence == gameResult.count {
        let sortedScores = scoreDic.sorted(by: { $0.value > $1.value } )
        var (sequence, average): ([Int], Double) = ([], 0.0)

        if sortedScores[0].value == sortedScores[3].value {
            sequence.append(contentsOf: 0...3)
            average = winningAverage * 1/2
        } else if sortedScores[1].value == sortedScores[3].value {
            sequence.append(contentsOf: 1...3)
            average = winningAverage * 1/3
            winningAverageDic[sortedScores[0].key]! += winningAverage
        } else if sortedScores[0].value == sortedScores[2].value {
            sequence.append(contentsOf: 0...2)
            average = winningAverage * 2/3
        } else if sortedScores[1].value == sortedScores[2].value {
            sequence.append(contentsOf: 1...2)
            average = winningAverage * 1/2
            winningAverageDic[sortedScores[0].key]! += winningAverage
        } else {
            sequence.append(contentsOf: 0...1)
            average = winningAverage
        }

        for i in sequence { winningAverageDic[sortedScores[i].key]! += average }
        return
    }

    if let winnigAveragePerGame = Double(gameResult[sequence][2]) {
        scoreDic[gameResult[sequence][0]]! += 3
        play(sequence+1, winnigAveragePerGame * winningAverage)
        scoreDic[gameResult[sequence][0]]! -= 3
    }
    if let winnigAveragePerGame = Double(gameResult[sequence][3]) {
        scoreDic[gameResult[sequence][0]]! += 1
        scoreDic[gameResult[sequence][1]]! += 1
        play(sequence+1, winnigAveragePerGame * winningAverage)
        scoreDic[gameResult[sequence][0]]! -= 1
        scoreDic[gameResult[sequence][1]]! -= 1
    }
    if let winnigAveragePerGame = Double(gameResult[sequence][4]) {
        scoreDic[gameResult[sequence][1]]! += 3
        play(sequence+1, winnigAveragePerGame * winningAverage)
        scoreDic[gameResult[sequence][1]]! -= 3
    }
}

play(0, 1)
team.forEach { print(winningAverageDic[$0]!) }
