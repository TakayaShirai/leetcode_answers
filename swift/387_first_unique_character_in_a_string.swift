class Solution {
  func firstUniqChar(_ s: String) -> Int {
    let charCounter: [Character: Int] = createCounter(of: s)

    for (curIdx, char) in s.enumerated() {
      guard let count = charCounter[char], count != 1 else {
        return curIdx
      }
    }

    return -1
  }

  private func createCounter(of str: String) -> [Character: Int] {
    var counter: [Character: Int] = [:]

    for char in str {
      counter[char, default: 0] += 1
    }

    return counter
  }
}
