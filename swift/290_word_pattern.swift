class Solution {
  func wordPattern(_ pattern: String, _ s: String) -> Bool {
    var patternToSMap: [Character: String] = [:]
    var sToPatternMap: [String: Character] = [:]

    let splittedS: [String] = s.components(separatedBy: " ")

    guard splittedS.count == pattern.count else { return false }

    for (char, str) in zip(pattern, splittedS) {
      if let mappedStr = patternToSMap[char] {
        guard mappedStr == str else { return false }
      }

      if let mappedPattern = sToPatternMap[str] {
        guard mappedPattern == char else { return false }
      }

      patternToSMap[char] = str
      sToPatternMap[str] = char
    }

    return true
  }
}
