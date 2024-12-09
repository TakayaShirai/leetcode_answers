class Solution {
  func isValid(_ s: String) -> Bool {
    var parenMap: [Character: Character] = [")": "(", "}": "{", "]": "["]
    var leftParenStack: [Character] = []

    for paren in s {
      if let matchedLeftParen = parenMap[paren] {
        guard !leftParenStack.isEmpty else { return false }

        let poppedLeftParen = leftParenStack.popLast()

        if matchedLeftParen != poppedLeftParen {
          return false
        }
      } else {
        leftParenStack.append(paren)
      }
    }

    return leftParenStack.isEmpty
  }
}
