import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var (aa, bb) = (a, b)
    
    repeat {
        aa, bb = ((aa + 1) / 2, (bb + 1) / 2)
        answer += 1
        
    } while aa != bb
    
    return answer
}
