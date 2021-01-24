func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    guard cacheSize > 0 else { return cities.count * 5 }
    
    let cities = cities.map({ $0.lowercased() })
    var cache = [String]()
    var runtime = 0
    
    for city in cities {
        if cache.contains(city) {
            if let index = cache.firstIndex(of: city) {
                cache.remove(at: index)
                cache.append(city)
            }
            runtime += 1
        } else {
            if cache.count == cacheSize { cache.removeFirst() }
            cache.append(city) 
            runtime += 5
        }
    }
    
    return runtime
}
