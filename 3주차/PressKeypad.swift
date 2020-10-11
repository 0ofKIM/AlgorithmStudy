import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var rightHandPosition = "#"
    var leftHandPosition = "*"
    var answer: String = ""

    //    let keypadPosition = [
    //        ["1", "2", "3"],
    //        ["4", "5", "6"],
    //        ["7", "8", "9"],
    //        ["*", "0", "#"]
    //    ]
    let keypadPosition: [String : (Int,Int)] = [
        "1":(1,1), "2":(1,2), "3":(1,3),
        "4":(2,1), "5":(2,2), "6":(2,3),
        "7":(3,1), "8":(3,2), "9":(3,3),
        "*":(4,1), "0":(4,2), "#":(4,3)
    ]


    for number in numbers {
        switch number {
        case 1,4,7:
            answer.append("L")
            leftHandPosition = String(number)
        case 3,6,9:
            answer.append("R")
            rightHandPosition = String(number)
        default:
            var leftDistance = 0
            var rightDistance = 0

            if let destination = keypadPosition[String(number)], let left = keypadPosition[leftHandPosition] {
                leftDistance = abs(destination.0 - left.0) + abs(destination.1 - left.1)
            }
            if let destination = keypadPosition[String(number)], let right = keypadPosition[rightHandPosition] {
                rightDistance = abs(destination.0 - right.0) + abs(destination.1 - right.1)
            }

            if leftDistance < rightDistance {
                leftHandPosition = String(number)
                answer.append("L")
            } else if leftDistance > rightDistance {
                rightHandPosition = String(number)
                answer.append("R")
            } else {
                if hand == "left" {
                    leftHandPosition = String(number)
                    answer.append("L")
                } else {
                    rightHandPosition = String(number)
                    answer.append("R")
                }
            }
        }
    }

    return answer
}
