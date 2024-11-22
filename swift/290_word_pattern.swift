class Solution {
  func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let arrayPattern = Array(pattern)
    let words: [String] = s.components(separatedBy: " ")

    guard arrayPattern.count == words.count else { return false }

    var patternToWord: [Character: String] = [:]
    var wordToPattern: [String: Character] = [:]

    for i in 0..<pattern.count {
      let curPattern = arrayPattern[i]
      let curWord = words[i]

      if !isUniquePatternToWord(curPattern, curWord) {
        return false
      }

      if !isUniqueWordToPattern(curPattern, curWord) {
        return false
      }

      updateSets(curPattern, curWord)
    }

    return true

    func isUniquePatternToWord(_ pattern: Character, _ word: String) -> Bool {
      if let mappedWord = patternToWord[pattern] {
        if mappedWord != word {
          return false
        }
      }

      return true
    }

    func isUniqueWordToPattern(_ pattern: Character, _ word: String) -> Bool {
      if let mappedPattern = wordToPattern[word] {
        if mappedPattern != pattern {
          return false
        }
      }

      return true
    }

    func updateSets(_ pattern: Character, _ word: String) {
      patternToWord[pattern] = word
      wordToPattern[word] = pattern
    }
  }
}
