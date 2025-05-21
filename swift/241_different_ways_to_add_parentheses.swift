class Solution {
  func diffWaysToCompute(_ expression: String) -> [Int] {
    guard !expression.isEmpty else {
      return []
    }

    guard expression.count > 2 else {
      guard let num = Int(expression) else { return [] }
      return [num]
    }

    var calcResults: [Int] = []

    for (idx, char) in expression.enumerated() {
      let operatorIndex = expression.index(expression.startIndex, offsetBy: idx)

      let leftSubstring = expression[expression.startIndex..<operatorIndex]
      let rightSubstring = expression[expression.index(after: operatorIndex)...]

      let leftResults = diffWaysToCompute(String(leftSubstring))
      let rightResults = diffWaysToCompute(String(rightSubstring))

      for leftNum in leftResults {
        for rightNum in rightResults {
          switch char {
          case "+":
            calcResults.append(leftNum + rightNum)
          case "-":
            calcResults.append(leftNum - rightNum)
          case "*":
            calcResults.append(leftNum * rightNum)
          default:
            continue
          }
        }
      }
    }

    return calcResults
  }
}
