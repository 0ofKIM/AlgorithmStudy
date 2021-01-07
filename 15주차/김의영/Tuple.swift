import Foundation

func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    s.replacingOccurrences(of: "},", with: "")
        .replacingOccurrences(of: "{{", with: "")
        .replacingOccurrences(of: "}}", with: "")
        .components(separatedBy: "{")
        .sorted { $0.count < $1.count }
        .forEach { stringElement in
            stringElement.components(separatedBy: ",").forEach {
                if let intElement = Int($0), !result.contains(intElement) {
                    result.append(intElement)
                }
            }
        }

    return result
}
