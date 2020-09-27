import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostArray: [Int] = lost
    var reserveArray: [Int] = reserve

    for lostNum in lostArray {
        if reserveArray.contains(lostNum) {
            lostArray = removeElement(lostArray, lostNum)
            reserveArray = removeElement(reserveArray, lostNum)
        }
    }

    for reserver in reserveArray {
        if (lostArray.contains(reserver-1) && lostArray.contains(reserver+1)) || (lostArray.contains(reserver-1)) {
            lostArray = removeElement(lostArray, reserver-1)
            reserveArray = removeElement(reserveArray, reserver)
        } else if lostArray.contains(reserver+1) {
            lostArray = removeElement(lostArray, reserver+1)
            reserveArray = removeElement(reserveArray, reserver)
        }
    }

    return n-lostArray.count
}

func removeElement(_ array: [Int], _ element: Int) -> [Int] {
    var returnArray = array

    if let index = returnArray.firstIndex(of: element) {
        returnArray.remove(at: index)
    }

    return returnArray
}
