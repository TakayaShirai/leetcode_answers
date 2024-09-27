class Solution {
  func numDecodings(_ s: String) -> Int {
    let arrayS = Array(s)
    guard arrayS[0] != "0" else { return 0 }
    var dp = Array(repeating: 0, count: s.count + 1)

    dp[0] = 1
    dp[1] = arrayS[0] == "0" ? 0 : 1

    for length in 2..<s.count + 1 {
      let oneDigit = Int(String(arrayS[length - 1]))!
      let twoDigits = Int(String(arrayS[length - 2...length - 1]))!

      if oneDigit >= 1 {
        dp[length] += dp[length - 1]
      }

      if twoDigits >= 10 && twoDigits <= 26 {
        dp[length] += dp[length - 2]
      }
    }

    return dp[s.count]
  }
}
