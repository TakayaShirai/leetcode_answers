class Solution {
  func countCharacters(_ words: [String], _ chars: String) -> Int {
    let charsCounter: [Character: Int] = createCounter(of: chars)
    var totalLen: Int = 0

    for word in words {
      var curCounter: [Character: Int] = charsCounter

      for (idx, char) in word.enumerated() {
        guard let remaining = curCounter[char], remaining > 0 else {
          break
        }

        guard idx != word.count - 1 else {
          totalLen += word.count
          break
        }
        curCounter[char] = remaining - 1
      }
    }

    return totalLen
  }

  private func createCounter(of str: String) -> [Character: Int] {
    var counter: [Character: Int] = [:]

    for char in str {
      counter[char, default: 0] += 1
    }

    return counter
  }
}
