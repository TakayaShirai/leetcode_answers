class Solution {
  func calPoints(_ operations: [String]) -> Int {
    var totalPoints: Int = 0
    var scoreStack: [Int] = []

    for operation in operations {
      switch operation {
      case "+":
        let prevScore: Int = scoreStack.removeLast()
        let secPrevScore: Int = scoreStack.removeLast()
        let curScore: Int = prevScore + secPrevScore
        totalPoints += curScore
        scoreStack.append(secPrevScore)
        scoreStack.append(prevScore)
        scoreStack.append(curScore)
      case "D":
        let prevScore: Int = scoreStack.removeLast()
        let curScore: Int = prevScore * 2
        totalPoints += curScore
        scoreStack.append(prevScore)
        scoreStack.append(curScore)
      case "C":
        let prevScore: Int = scoreStack.removeLast()
        totalPoints -= prevScore
      default:
        let curScore: Int = Int(operation)!
        totalPoints += curScore
        scoreStack.append(curScore)
      }
    }

    return totalPoints
  }
}
