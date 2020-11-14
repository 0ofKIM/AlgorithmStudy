import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var impossibleCount = 0

    for skillTrees in skill_trees {
        var skillArray = skill

        for skillTree in skillTrees {
            if (skillTree != skillArray.first) && skillArray.contains(skillTree) {
                impossibleCount += 1
                break
            } else if skillTree == skillArray.first {
                skillArray.removeFirst()
            }
        }
    }

    return skill_trees.count - impossibleCount
}
