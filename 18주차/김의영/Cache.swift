func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    guard cacheSize != 0 else { return 5*cities.count }
    var cache: [String] = []
    var result = 0
    
    cities.forEach {
        result += cache.contains($0.lowercased()) ? 1 : 5
        if cache.count == cacheSize {
            cache.remove(at: cache.contains($0.lowercased()) ? cache.firstIndex(of: $0.lowercased())! : 0)
        }
        cache.append($0.lowercased())
    }
    return result
}
