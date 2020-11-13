func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    
    for skillTree in skill_trees {
        result += 1
        
        var index = skill.startIndex
        for char in skillTree {
            if skill.contains(char) {
                if char != skill[index] {
                    result -= 1
                    break    
                }
                index = skill.index(after: index)
            }
        }
    }
    
    return result
}
