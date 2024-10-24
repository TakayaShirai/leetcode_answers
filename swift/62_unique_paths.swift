class Solution {
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp: [[Int]] = Array(repeating: Array(repeating: 1, count: n), count: m)

    for row in (0..<m - 1).reversed() {
      for column in (0..<n - 1).reversed() {
        dp[row][column] = dp[row + 1][column] + dp[row][column + 1]
      }
    }

    return dp[0][0]
  }
}
