import Foundation

extension String {
    subscript(index: Int) -> Character {
        let chrIndex: String.Index
        
        if index >= 0 {
            chrIndex = self.index(self.startIndex, offsetBy: index)
        } else {
            chrIndex = self.index(self.endIndex, offsetBy: index)
        }
        return self[chrIndex]
    }
}

func solution(_ p:String) -> String {
    if p == "" { return "" }

    var unPaired = 0
    var isProper: Bool = true

    for i in 0..<p.count {
        unPaired += (p[i] == "(") ? 1 : -1

        if unPaired < 0 { 
            isProper = false
        } else if unPaired == 0 {
            let u = p.substring(to: i+1)
            let v = p.substring(from: i+1)            
            let balancedV = solution(v)

            for j in 0..<u.count {
                unPaired += (u[j] == "(") ? 1 : -1

                if unPaired < 0 {
                    var properU = u
                    properU.removeFirst()
                    properU.removeLast()   
                    properU = String(properU.map { $0 == "(" ? ")": "(" })
                    return "(" + balancedV + ")" + properU
                }   
            }
            return u + balancedV
        }   
    }

    return ""
}
