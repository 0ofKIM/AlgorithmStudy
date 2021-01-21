func solution(_ str1:String, _ str2:String) -> Int {
        
    func createMultiSet(_ str: String) -> [String] {
        var multiSet = [String]()
        let str = Array(str.lowercased())
        
        for (one, two) in zip(str, str[1...]) {
            if ("a"..."z").contains(one) && ("a"..."z").contains(two) {
                multiSet.append((String(one)+String(two)))
            }
        }
        
        return multiSet
    }
    
    let (multiSet1, multiSet2) = (createMultiSet(str1), createMultiSet(str2))
    if multiSet1.count * multiSet2.count == 0 {
        return multiSet1.count == 0 && multiSet2.count == 0 ? 65536 : 0
    }
    
    let (set1, set2) = (Set(multiSet1), Set(multiSet2))
    if multiSet1.count == set1.count && multiSet2.count == set2.count {
        return Int(Double(set1.intersection(set2).count) / Double(set1.union(set2).count) * 65536)
    }
    
    let dict1 = Dictionary(multiSet1.map { ($0, 1) }, uniquingKeysWith: +)
    let dict2 = Dictionary(multiSet2.map { ($0, 1) }, uniquingKeysWith: +)

    var (mom, son) = (0, 0)
    for key in Set(Array(dict1.keys) + Array(dict2.keys)) {
        
        if let count1 = dict1[key], let count2 = dict2[key] {
            son += min(count1, count2)
            mom += max(count1, count2)
        } else {
            mom += (dict1[key] ?? 0) + (dict2[key] ?? 0)
        }
    }
    
    return Int(Double(son)/Double(mom) * 65536)
}
