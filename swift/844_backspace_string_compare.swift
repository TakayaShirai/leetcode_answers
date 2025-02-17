class Solution {
  func backspaceCompare(_ s: String, _ t: String) -> Bool {
    var sTypedChars: [Character] = gainTypedChars(of: s)
    var tTypedChars: [Character] = gainTypedChars(of: t)
    return sTypedChars == tTypedChars
  }

  private func gainTypedChars(of str: String) -> [Character] {
    var typedCharsStack: [Character] = []

    for char in str {
      if char == Character("#") {
        guard !typedCharsStack.isEmpty else { continue }
        typedCharsStack.removeLast()
      } else {
        typedCharsStack.append(char)
      }
    }

    return typedCharsStack
  }
}
