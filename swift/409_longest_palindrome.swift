class Solution {
  func longestPalindrome(_ s: String) -> Int {
    var charCounter: [Character: Int] = createCharCounter(of: s)
    var existsOddCntChar: Bool = false
    var longestPalindromeCnt: Int = 0

    for count in charCounter.values {
      if count % 2 == 0 {
        longestPalindromeCnt += count
      } else {
        if existsOddCntChar {
          longestPalindromeCnt += count - 1
        } else {
          longestPalindromeCnt += count
          existsOddCntChar = true
        }
      }
    }

    return longestPalindromeCnt
  }

  private func createCharCounter(of str: String) -> [Character: Int] {
    var charCounter: [Character: Int] = [:]

    for char in str {
      charCounter[char, default: 0] += 1
    }

    return charCounter
  }
}
