import Foundation

func contains666(_ string: String) -> Bool {
    var str = string.map{ $0 }
    while let index = str.firstIndex(of: "6") {
        if index < str.count-2 && str[index+1] == "6" && str[index+2] == "6" {
            return true
        }
        str = Array(str[(index+1)...])
    }
    return false
}

if let N = Int(readLine()!) {
    var count = 0

    for i in 666...2666799 where contains666(String(i)) {
        count += 1 
        if count == N { 
            print(i)
            break 
        }
    }
}
