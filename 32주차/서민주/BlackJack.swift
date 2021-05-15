let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M) = (NM[0], NM[1])

let cards = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()

var answer = 0
loop: for i in 0..<N {
    for j in i+1..<N {
        for k in j+1..<N {
            let sum = cards[i] + cards[j] + cards[k]
            
            guard sum <= M else { break }

            if sum > answer { answer = sum }
        }
    }
}

print(answer)
