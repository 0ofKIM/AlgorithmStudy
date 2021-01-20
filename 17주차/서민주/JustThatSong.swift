func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result = (title: "", duration: 0)
    var mConverted = m
    
    for info in musicinfos {    
        let splitted = info.components(separatedBy: ",")    
    
        let (startTimeStr, endTimeStr, title) = (splitted[0], splitted[1], splitted[2])
        var notes = splitted[3]
        
        let startTime = startTimeStr.components(separatedBy: ":").map{ Int($0)! }
        let endTime = endTimeStr.components(separatedBy: ":").map{ Int($0)! }
        let duration = (endTime[0] - startTime[0]) * 60 + endTime[1] - startTime[1]
 
        for (sharp, lower) in zip(["C#", "D#", "F#", "G#", "A#"], ["c", "d", "f", "g", "a"]) {
            notes = notes.replacingOccurrences(of: sharp, with: lower)
            mConverted = mConverted.replacingOccurrences(of: sharp, with: lower)
        }
        
        var allNotes = String(repeating: notes, count: duration / notes.count)
        allNotes += notes.prefix(duration % notes.count)
        
        if allNotes.contains(mConverted) && result.duration < duration {
            result = (title, duration)
        }
    }
    
    return result.duration == 0 ? "(None)" : result.title
}
