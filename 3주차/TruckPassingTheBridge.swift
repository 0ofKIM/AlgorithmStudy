import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var answer = 0
    var timeOnBridge: [Int] = [] //트럭이 다리에 오른 시간을 저장
    var bridgeWeight = 0
    var truckOnTheBridge: [Int] = []
    var waitingTruck = truck_weights

    while true {
        answer += 1

        if let truck = truckOnTheBridge.first, (answer-timeOnBridge.first!) == bridge_length {
            truckOnTheBridge.removeFirst()
            timeOnBridge.removeFirst()
            bridgeWeight -= truck
        }

        if let truck = waitingTruck.first, (bridgeWeight + truck) <= weight {
            truckOnTheBridge.append(truck)
            timeOnBridge.append(answer)
            bridgeWeight += truck
            waitingTruck.removeFirst()
        }

        if truckOnTheBridge.isEmpty && waitingTruck.isEmpty {
            return answer
        }
    }

    return answer
}
