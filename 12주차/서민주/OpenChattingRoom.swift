import Foundation

func solution(_ record:[String]) -> [String] {

    var msgs = [(uid:String, command:String)]()
    var userDict = [String:String]()

    record.forEach {
        let msg = $0.components(separatedBy: " ")
        let (command, uid) = (msg[0], msg[1])
        
        switch command {
        case "Leave":
            msgs.append((uid: uid, command: "님이 나갔습니다."))
            
        case "Enter":
            msgs.append((uid: uid, command: "님이 들어왔습니다."))
            fallthrough
            
        default:
            let name = msg[2]
            userDict[uid] = name
        }
    }
    
    return msgs.map { "\(userDict[$0.uid]!)\($0.command)" }
}
