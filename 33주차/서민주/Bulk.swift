func isBulkier(_ person1: [Int],_ person2: [Int]) -> Bool {
    return person1[0] > person2[0] && person1[1] > person2[1]
}

if let N = Int(readLine()!) {

    var bulks = (1...N).map { _ in
        readLine()!.split(separator: " ").map{ Int(String($0))! } 
    }

    for i in 0..<N {
        var bulkier = 0
        for j in 0..<N where i != j && isBulkier(bulks[j], bulks[i]) {
            bulkier += 1
        }
        print(bulkier + 1, terminator: " ")
    }
}
