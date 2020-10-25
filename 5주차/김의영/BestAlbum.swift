import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playByGenres: [String:Int] = [:]
    var musicByGenres: [String:[Int]] = [:]
    var answer: [Int] = []

    //장르별 재생 횟수, 장르별 노래 번호
    for number in 0..<genres.count {
        if playByGenres[genres[number]] == nil && musicByGenres[genres[number]] == nil {
            playByGenres.updateValue(plays[number], forKey: genres[number])
            musicByGenres.updateValue([number], forKey: genres[number])
        } else {
            playByGenres[genres[number]]! += plays[number]
            musicByGenres[genres[number]]!.append(number)
        }
    }

    let topGenre: [String] = Array(musicByGenres.keys).sorted {
        return playByGenres[$0]! > playByGenres[$1]!
    }

    for genre in topGenre {
        let musicNumber = musicByGenres[genre]!.sorted {
            return plays[$0] > plays[$1]
        }
        answer.append(musicNumber[0])
        if musicNumber.count > 1 {
            answer.append(musicNumber[1])
        }
    }

    return answer
}
