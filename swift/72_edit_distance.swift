class Solution {
  func minDistance(_ word1: String, _ word2: String) -> Int {
    if word1 == word2 {
      return 0
    }

    var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)

    let arrayW1 = Array(word1)
    let arrayW2 = Array(word2)

    for row in 0..<(word1.count + 1) {
      dp[row][word2.count] = word1.count - row
    }

    for col in 0..<(word2.count + 1) {
      dp[word1.count][col] = word2.count - col
    }

    for row in (0..<word1.count).reversed() {
      for col in (0..<word2.count).reversed() {
        if arrayW1[row] == arrayW2[col] {
          dp[row][col] = dp[row + 1][col + 1]
        } else {
          let inserted = dp[row + 1][col]
          let deleted = dp[row][col + 1]
          let replaced = dp[row + 1][col + 1]

          dp[row][col] = min(min(inserted, deleted), replaced) + 1
        }
      }
    }

    return dp[0][0]
  }
}
