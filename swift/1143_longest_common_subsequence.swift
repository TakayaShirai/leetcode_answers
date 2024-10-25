class Solution {
  func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    if text1 == text2 {
      return text1.count
    }

    let text1Len = text1.count
    let text2Len = text2.count
    let arrayText1 = Array(text1)
    let arrayText2 = Array(text2)

    var dp = Array(repeating: Array(repeating: 0, count: text2Len + 1), count: text1Len + 1)

    for i in (0..<text1Len).reversed() {
      for j in (0..<text2Len).reversed() {
        if arrayText1[i] == arrayText2[j] {
          dp[i][j] = 1 + dp[i + 1][j + 1]
        } else {
          dp[i][j] = max(dp[i + 1][j], dp[i][j + 1])
        }
      }
    }

    return dp[0][0]
  }
}
