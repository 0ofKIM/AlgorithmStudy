class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionaryLookingForAnswer: [Int:Int] = [:]

        for (index, num) in nums.enumerated() {
            if dictionaryLookingForAnswer[num] == nil {
                let numberLookingFor = target - num
                dictionaryLookingForAnswer.updateValue(index, forKey: numberLookingFor)
            } else {
                return [dictionaryLookingForAnswer[num]!, index]
            }
        }
    
        return []
    }
}
