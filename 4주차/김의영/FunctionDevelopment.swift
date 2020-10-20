import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var days: [Int] = []
    var day: Double = 0

    for (index, progress) in progresses.enumerated() {
        if day < ceil(Double(100-progress) / Double(speeds[index])) {
            day = ceil(Double(100-progress) / Double(speeds[index]))
            days.append(1)
        } else {
            days[days.count-1] += 1
        }
    }

    return days
}
