import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var (teamA, teamB, round) = ((a-1)/2, (b-1)/2, 1)

    while teamA != teamB {
        (teamA, teamB) = (teamA/2, teamB/2)
        round += 1
    }

    return round
}
