import Foundation

func solution(_ record:[String]) -> [String] {
    var idDic: [String:String] = [:]
    var historyTuple: [(String, String)] = []
    var result: [String] = []

    for reco in record {
        let splitedReco = reco.split(separator: " ", maxSplits: 2)
        let type = String(splitedReco[0])
        let id = String(splitedReco[1])
        let name = type == "Leave" ? "" : String(splitedReco[2])

        switch type {
        case "Enter":
            if idDic[id] == nil { idDic.updateValue(name, forKey: id) }
            else { idDic[id] = name }
            historyTuple.append((id, "들어왔습니다."))
        case "Leave": historyTuple.append((id, "나갔습니다."))
        case "Change": idDic[id] = name
        default: break
        }
    }

    for history in historyTuple {
        result.append("\(idDic[history.0]!)님이 \(history.1)")
    }

    return result
}
