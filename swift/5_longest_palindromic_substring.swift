class Solution {
  func longestPalindrome(_ s: String) -> String {
    let length: Int = s.count
    let arrayS = Array(s)
    guard length > 1 else { return s }

    var left = 0
    var right = 0
    var dp = Array(repeating: Array(repeating: 0, count: length), count: length)

    for i in 1..<length {
      for j in 0..<i {
        if arrayS[j] == arrayS[i] && (dp[j + 1][i - 1] == 1 || i - j <= 2) {
          dp[j][i] = 1
          if i - j > right - left {
            left = j
            right = i
          }
        }
      }
    }
    return String(arrayS[left...right])
  }
}
