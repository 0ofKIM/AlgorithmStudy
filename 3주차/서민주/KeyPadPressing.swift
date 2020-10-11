import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var l = [3, 0]
    var r = [3, 2]
    var keypad = [1: [0, 0], 2: [0, 1], 3: [0, 2],
                  4: [1, 0], 5: [1, 1], 6: [1, 2],
                  7: [2, 0], 8: [2, 1], 9: [2, 2],
                  0: [3, 1]]

    for num in numbers {
        if [1, 4, 7].contains(num) {
            answer += "L"
            l = keypad[num]!
            
        } else if [3, 6, 9].contains(num) {
            answer += "R"
            r = keypad[num]!
            
        } else {
            var coordinate = keypad[num]!

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
