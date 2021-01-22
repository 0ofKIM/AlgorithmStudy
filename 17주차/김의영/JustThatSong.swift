import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var musicArray: [[String]] = []
    musicinfos.forEach {
        let musicInfo = $0.components(separatedBy: ",")
        musicArray.append(musicInfo)
    }
    var toneArray: [String] = Array(repeating: "", count: musicArray.count)
    var result: (Int, String) = (0,"")

    for (index, music) in musicArray.enumerated() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let startTime = dateFormatter.date(from: music[0])
        let endTime = dateFormatter.date(from: music[1])
        guard let timeDifference = (endTime?.timeIntervalSince(startTime!)) else { return "" }

        let filteredTone = replacePoundKey(tone: music[3])
        let filteredM = replacePoundKey(tone: m)

        for i in 0..<Int(abs(timeDifference))/60 {
            let toneIndex = i%filteredTone.count
            let tone = filteredTone[filteredTone.index(filteredTone.startIndex, offsetBy: toneIndex)]
            toneArray[index].append(tone)
        }

        if toneArray[index].contains(filteredM) && result.0 < Int(timeDifference)/60 && !toneArray[index].contains(m+"#") {
            result.0 = Int(timeDifference)/60
            result.1 = musicArray[index][2]
        }
    }

    return result.1 == "" ? "(None)" : result.1
}

func replacePoundKey(tone: String) -> String {
    var replacedTone = tone
    replacedTone = replacedTone.replacingOccurrences(of: "A#", with: "H")
    replacedTone = replacedTone.replacingOccurrences(of: "C#", with: "I")
    replacedTone = replacedTone.replacingOccurrences(of: "D#", with: "J")
    replacedTone = replacedTone.replacingOccurrences(of: "F#", with: "K")
    replacedTone = replacedTone.replacingOccurrences(of: "G#", with: "L")

    return replacedTone
}
