class Solution {
  func evalRPN(_ tokens: [String]) -> Int {
    var numsStack: [Int] = []
    let minimumRequiredNumsCnt: Int = 2

    for token in tokens {
      if let num = Int(token) {
        numsStack.append(num)
      } else {
        guard numsStack.count >= minimumRequiredNumsCnt else { return -1 }
        let rightNum: Int = numsStack.removeLast()
        let leftNum: Int = numsStack.removeLast()
        switch token {
        case "+":
          numsStack.append(leftNum + rightNum)
        case "-":
          numsStack.append(leftNum - rightNum)
        case "/":
          numsStack.append(leftNum / rightNum)
        case "*":
          numsStack.append(leftNum * rightNum)
        default:
          return -1
        }
      }
    }

    return numsStack.removeLast()
  }
}
