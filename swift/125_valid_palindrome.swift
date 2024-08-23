class Solution {
  func isPalindrome(_ s: String) -> Bool {
    var forwardPointer: String.Index = s.startIndex
    var backwardPointer: String.Index = s.index(before: s.endIndex)

    while forwardPointer < backwardPointer {
      while !isAlphaNum(s[forwardPointer]) && forwardPointer < backwardPointer {
        forwardPointer = s.index(after: forwardPointer)
      }

      while !isAlphaNum(s[backwardPointer]) && forwardPointer < backwardPointer {
        backwardPointer = s.index(before: backwardPointer)
      }

      if s[forwardPointer].lowercased() != s[backwardPointer].lowercased() {
        return false
      }

      if forwardPointer == backwardPointer {
        return true
      }

      forwardPointer = s.index(after: forwardPointer)
      backwardPointer = s.index(before: backwardPointer)
    }

    return true
  }

  func isAlphaNum(_ char: Character) -> Bool {
    if ("A".unicodeScalars.first!.value <= char.unicodeScalars.first!.value
      && "Z".unicodeScalars.first!.value >= char.unicodeScalars.first!.value)
      || ("a".unicodeScalars.first!.value <= char.unicodeScalars.first!.value
        && "z".unicodeScalars.first!.value >= char.unicodeScalars.first!.value)
      || ("0".unicodeScalars.first!.value <= char.unicodeScalars.first!.value
        && "9".unicodeScalars.first!.value >= char.unicodeScalars.first!.value)
    {
      return true
    } else {
      return false
    }
  }
}
