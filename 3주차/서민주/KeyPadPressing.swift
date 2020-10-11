import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var l = [3, 0]
    var r = [3, 2]

    for num in numbers {
        if [1, 4, 7].contains(num) {
            answer += "L"
            switch num {
            case 1: l = [0, 0]
            case 4: l = [1, 0]
            case 7: l = [2, 0]
            default: break
            }
            
        } else if [3, 6, 9].contains(num) {
            answer += "R"
            switch num {
            case 3: r = [0, 2]
            case 6: r = [1, 2]
            case 9: r = [2, 2]
            default: break
            }
            
        } else {
            var coordinate = [Int]()
            switch num {
            case 2: coordinate = [0, 1]
            case 5: coordinate = [1, 1]
            case 8: coordinate = [2, 1]
            case 0: coordinate = [3, 1]
            default: break
            }

            let l_diff = abs(l[0]-coordinate[0]) + abs(l[1]-coordinate[1])
            let r_diff = abs(r[0]-coordinate[0]) + abs(r[1]-coordinate[1])
            
            if l_diff < r_diff || (l_diff == r_diff && hand == "left"){
                answer += "L"
                l = coordinate
            } else if l_diff > r_diff || (l_diff == r_diff && hand == "right") {
                answer += "R"
                r = coordinate
            }
        }
    }

    return answer
}
