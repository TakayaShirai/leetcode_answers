class Solution {
  func countPrefixSuffixPairs(_ words: [String]) -> Int {
    var validPairsCnt: Int = 0

    for str1Idx in 0..<words.count {
      for str2Idx in (str1Idx + 1)..<words.count {
        if isPrefixAndSuffix(words[str1Idx], words[str2Idx]) {
          validPairsCnt += 1
        }
      }
    }

    return validPairsCnt
  }

  private func isPrefixAndSuffix(_ str1: String, _ str2: String) -> Bool {
    guard str1.count <= str2.count else { return false }

    let prefix: String = String(Array(str2)[0..<str1.count])
    let suffix: String = String(Array(str2)[str2.count - str1.count..<str2.count])

    return prefix == str1 && suffix == str1
  }
}
