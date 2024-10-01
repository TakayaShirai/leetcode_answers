class Solution {
  func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = Array(repeating: 1, count: nums.count)
    var longestIncSub: Int = 0

    for i in 0..<nums.count {
      for j in 0..<i {
        if nums[j] < nums[i] {
          dp[i] = max(dp[i], dp[j] + 1)
        }
      }

      longestIncSub = max(longestIncSub, dp[i])
    }

    return longestIncSub
  }
}
