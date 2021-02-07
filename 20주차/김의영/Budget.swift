func solution(_ d:[Int], _ budget:Int) -> Int {
    var (sum, count, sortedD) = (0, 0, d.sorted(by: <))

    for d in sortedD where (d + sum) <= budget {
        sum += d
        count += 1
    }

    return count
}
