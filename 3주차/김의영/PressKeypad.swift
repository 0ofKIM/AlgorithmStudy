import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var rightHandPosition = "#"
    var leftHandPosition = "*"
    var answer: String = ""

    let keypadPosition: [String : (Int,Int)] = [
        "1":(0,0), "2":(0,1), "3":(0,2),
        "4":(1,0), "5":(1,1), "6":(1,2),
        "7":(2,0), "8":(2,1), "9":(2,2),
        "*":(3,0), "0":(3,1), "#":(3,2)
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
            } else if leftDistance == rightDistance {
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
