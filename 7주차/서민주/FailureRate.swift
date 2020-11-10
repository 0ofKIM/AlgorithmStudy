import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var reachOnly = [Int](repeating: 0, count: N+1)
    var clear = [Int](repeating: 0, count: N+1)
    var rate = [Int:Double]()

    for challenging in stages {
        var challenging = challenging
        
	if challenging > N {
            challenging -= 1
            clear[challenging] += 1
        } else {
           reachOnly[challenging] += 1 
        }
        
        for stage in 1..<challenging {
            clear[stage] += 1
        }
    }

    for stage in 1...N {
        rate[stage] = reachOnly[stage] == 0 ? 0 : Double(reachOnly[stage]) / Double(clear[stage])
    }

    return rate.sorted{ $0.1 == $1.1 ? $0.0<$1.0 : $0.1>$1.1 }.map{ $0.key }
}
