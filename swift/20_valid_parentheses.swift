class Solution {
  /// isValid returns if the input string of parentheses is valid.
  func isValid(_ s: String) -> Bool {
    var pairs: [Character: Character] = ["(": ")", "{": "}", "[": "]"]

    var stack: [Character] = []

    for parenthes in s {
      if pairs.keys.contains(parenthes) {
        stack.append(parenthes)
      } else {
        if stack.isEmpty {
          return false
        } else {
          var poppedParenthes = stack.popLast()!

          if parenthes != pairs[poppedParenthes] {
            return false
          }
        }
      }
    }
    return stack.isEmpty
  }
}
