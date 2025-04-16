class Solution {
  func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var magazineCharCounter: [Character: Int] = createCharCounter(of: magazine)

    for char in ransomNote {
      let charCount = magazineCharCounter[char, default: 0]
      guard charCount > 0 else { return false }
      magazineCharCounter[char, default: 0] -= 1
    }

    return true
  }

  private func createCharCounter(of str: String) -> [Character: Int] {
    var charCounter: [Character: Int] = [:]

    for char in str {
      charCounter[char, default: 0] += 1
    }

    return charCounter
  }
}
