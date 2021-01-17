import Foundation

func separateString(strParam: String, array: inout [String]) {
    for (index, str) in strParam.enumerated() {
        if index == strParam.count-1 { break }

        let elements = "\(String(str))\(strParam[strParam.index(strParam.startIndex, offsetBy: index+1)])".lowercased()
        var isOnlyAlphabet = true
        for element in elements {
            let asciiValue = UnicodeScalar(String(element))!.value
            if !(97 <= asciiValue && asciiValue <= 122) {
                isOnlyAlphabet = false
                break
            }
        }
        if isOnlyAlphabet { array.append(String(elements)) }
        else { isOnlyAlphabet = true }
    }
}

func solution(_ str1:String, _ str2:String) -> Int {
    var str1Array: [String] = []
    var str2Array: [String] = []
    var intersection: [String] = []
    var union: [String] = []

    separateString(strParam: str1, array: &str1Array)
    separateString(strParam: str2, array: &str2Array)

    var tempStr2 = str2Array
    for str1 in str1Array {
        for str2 in tempStr2 {
            if str1 == str2 {
                intersection.append(str1)
                tempStr2.remove(at: Int(tempStr2.firstIndex(of: str1)!))
                break
            }
        }
    }

    tempStr2 = str2Array
    str1Array.forEach { str1 in
        if tempStr2.contains(str1) { tempStr2.remove(at: Int(tempStr2.firstIndex(of: str1)!)) }
    }
    union = str1Array + tempStr2

    return intersection.isEmpty && union.isEmpty ? 65536 : Int(Double(intersection.count)/Double(union.count)*65536)
}
