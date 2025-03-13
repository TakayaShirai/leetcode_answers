class Solution {
  func commonChars(_ words: [String]) -> [String] {
    var curCommonCharsCounter: [Character: Int] = createCharCounter(of: words[0])
    var commonChars: [String] = []

    for word in words {
      let curCharCounter = createCharCounter(of: word)
      curCommonCharsCounter = findDuplicates(
        charCounter1: curCommonCharsCounter, charCounter2: curCharCounter)
    }

    for (char, count) in curCommonCharsCounter {
      for _ in 0..<count {
        commonChars.append(String(char))
      }
    }

    return commonChars
  }

  private func createCharCounter(of str: String) -> [Character: Int] {
    var charCounter: [Character: Int] = [:]

    for char in str {
      charCounter[char, default: 0] += 1
    }

    return charCounter
  }

  private func findDuplicates(charCounter1: [Character: Int], charCounter2: [Character: Int])
    -> [Character: Int]
  {
    var duplicates: [Character: Int] = [:]

    for (char, count1) in charCounter1 {
      if let count2 = charCounter2[char] {
        duplicates[char] = min(count1, count2)
      }
    }

    return duplicates
  }
}
