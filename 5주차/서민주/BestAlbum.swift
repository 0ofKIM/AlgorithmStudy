import Foundation

func getMostPlayedSong(_ plays:[(Int, Int)]) -> [Int] {
    if plays.count == 1 { return [plays[0].0] }
    
    let sorted: [(Int, Int)] = plays.sorted{ 
        if $0.1 == $1.1 { 
            return $0.0 < $1.0 
        }
        return $0.1 > $1.1 
    }
    return [sorted[0].0, sorted[1].0] 
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var answer = [Int]()
    var genreDict = [String: (Int, [Int])]()    
    // ["pop": (3100, [1, 4]), "classic": (1450, [0, 2, 3])]
    
    for (index, genre) in genres.enumerated() {
        if genreDict.keys.contains(genre) {
            genreDict[genre]!.0 += plays[index]
            genreDict[genre]!.1 += [index]
        } else {
            genreDict[genre] = (plays[index], [index])    
        }
    }
    
    genreDict.values.sorted{ $0.0 > $1.0 }.forEach {
        answer += getMostPlayedSong($0.1.map {($0, plays[$0])}) // [(고유번호, 재생횟수)]    
    }
    
    return answer
}
