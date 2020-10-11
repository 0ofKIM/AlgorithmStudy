import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var answer = 0
    var cur_weight = 0
    var onbridge = [[Int]]()

    for (t_idx, truck) in truck_weights.enumerated() {
        cur_weight += truck
        onbridge.append([truck, bridge_length])
       
        while true {
            answer += 1
            for b_idx in 0..<onbridge.count {
                onbridge[b_idx][1] -= 1
            }
            if onbridge[0][1] <= 0 {
                cur_weight -= onbridge[0][0]
                onbridge.removeFirst()
                if onbridge.isEmpty { break }
            } 
            if t_idx < truck_weights.count-1 && 
                cur_weight + truck_weights[t_idx+1] <= weight { break }
        }
    }
    
    return answer + 1
}
