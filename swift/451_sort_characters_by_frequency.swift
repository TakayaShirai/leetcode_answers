class Solution {
  func frequencySort(_ s: String) -> String {
    return bucketSort(str: s)
  }

  private func bucketSort(str: String) -> String {
    guard !str.isEmpty else { return "" }

    let charCounter = createCharCounter(of: str)
    var buckets: [[Character]] = Array(repeating: [], count: str.count + 1)

    for (char, count) in charCounter {
      buckets[count].append(char)
    }

    var sortedChars = ""
    for idx in stride(from: buckets.count - 1, through: 1, by: -1) {
      for char in buckets[idx] {
        sortedChars.append(String(repeating: char, count: idx))
      }
    }

    return sortedChars
  }

  private func createCharCounter(of str: String) -> [Character: Int] {
    var charCounter: [Character: Int] = [:]

    for char in str {
      charCounter[char, default: 0] += 1
    }

    return charCounter
  }
}
