func solution(aTeam: Int, bTeam: Int, current: Int) {
    if (aTeam == n/2) && (bTeam == n/2) {
        var (aTeamResult, bTeamResult) = (0, 0)

        for i in 1..<n/2 {
            for j in 0..<i {
                aTeamResult += statArray[aTeamArray[i]][aTeamArray[j]] + statArray[aTeamArray[j]][aTeamArray[i]];
                bTeamResult += statArray[bTeamArray[i]][bTeamArray[j]] + statArray[bTeamArray[j]][bTeamArray[i]];
            }
        }
        result = min(result, abs(aTeamResult-bTeamResult))
        return
    }
    if aTeam < n/2 {
        aTeamArray[aTeam] = current
        solution(aTeam: aTeam+1, bTeam: bTeam, current: current+1)
    }

    if bTeam < n/2 {
        bTeamArray[bTeam] = current
        solution(aTeam: aTeam, bTeam: bTeam+1, current: current+1)
    }
}

let n = Int(readLine()!)!
var aTeamArray: Array = Array(repeating: 0, count: 21)
var bTeamArray: Array = Array(repeating: 0, count: 21)
var result: Int = Int.max
var statArray: Array = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    statArray[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

solution(aTeam: 0, bTeam: 0, current: 0)
print(result)
