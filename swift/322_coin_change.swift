class Solution {
  func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = Array(repeating: amount + 1, count: amount + 1)
    dp[0] = 0

    for curAmount in (1..<amount + 1) {
      for coin in coins {
        if curAmount - coin >= 0 {
          dp[curAmount] = min(dp[curAmount], dp[curAmount - coin] + 1)
        }
      }
    }

    return dp[amount] != (amount + 1) ? dp[amount] : -1
  }
}
