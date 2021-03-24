import Foundation

let nations = readLine()!.components(separatedBy: " ")

var scores = [String: Int](uniqueKeysWithValues: nations.map{ ($0, 0) })
var probabilities = [String: Double](uniqueKeysWithValues: nations.map{ ($0, 0) })
var rounds = (1...6).map{ _ in readLine()!.components(separatedBy: " ") }

func game(_ index: Int, _ probability: Double) {
    if probability == 0 { return }
    if index == 6 {
        let sortedScores = scores.sorted(by: { $0.value > $1.value })
        var (range, prob): (ClosedRange<Int>, Double)

        if sortedScores[0].value == sortedScores[3].value { (range, prob) = (0...3, probability * 1/2) } 
        else if sortedScores[0].value == sortedScores[2].value { (range, prob) = (0...2, probability * 2/3) } 
        else if sortedScores[1].value == sortedScores[3].value {
            probabilities[sortedScores[0].key]! += probability
            (range, prob) = (1...3, probability * 1/3)
        } else if sortedScores[1].value == sortedScores[2].value  {
            probabilities[sortedScores[0].key]! += probability
            (range, prob) = (1...2, probability * 1/2)
        } else {
            (range, prob) = (0...1, probability)
        }

        for i in range { probabilities[sortedScores[i].key]! += prob }
        return
    }
    
    scores[rounds[index][0]]! += 3
    game(index+1, probability * Double(rounds[index][2])!)
    scores[rounds[index][0]]! -= 3
    
    scores[rounds[index][0]]! += 1
    scores[rounds[index][1]]! += 1
    game(index+1, probability * Double(rounds[index][3])!)
    scores[rounds[index][0]]! -= 1
    scores[rounds[index][1]]! -= 1
    
    scores[rounds[index][1]]! += 3
    game(index+1, probability * Double(rounds[index][4])!)
    scores[rounds[index][1]]! -= 3
}

game(0, 1)
nations.forEach{ print(probabilities[$0]!) }

