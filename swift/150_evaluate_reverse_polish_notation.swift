class Solution {
  func evalRPN(_ tokens: [String]) -> Int {
    var numStack: [Int] = []

    for token in tokens {
      if token == "+"
        || token == "-"
        || token == "*"
        || token == "/"
      {
        var numOne: Int = numStack.popLast()!
        var numTwo: Int = numStack.popLast()!

        switch token {
        case "+":
          numStack.append(numTwo + numOne)
        case "-":
          numStack.append(numTwo - numOne)
        case "*":
          numStack.append(numTwo * numOne)
        case "/":
          numStack.append(numTwo / numOne)
        default:
          break
        }
      } else {
        numStack.append(Int(token)!)
      }
    }

    return numStack[0]
  }
}
