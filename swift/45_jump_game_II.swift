class Solution {
  func jump(_ nums: [Int]) -> Int {
    // Greedy Solution
    var left: Int = 0
    var right: Int = 0
    var res: Int = 0

    while right < nums.count - 1 {
      var farthest: Int = left

      for i in left..<right + 1 {
        farthest = max(farthest, i + nums[i])
      }

      left = right + 1
      right = farthest
      res += 1
    }

    return res

    // DP solution
    //         var dp = Array(repeating: 100000, count: nums.count)

    //         dp[nums.count-1] = 0

    //         for i in (0..<nums.count-1).reversed() {
    //             for jump in (1..<nums[i]+1).reversed() {
    //                 if jump + i >= nums.count - 1 {
    //                     dp[i] = 1
    //                     break
    //                 } else {
    //                     dp[i] = min(dp[i], dp[jump + i] + 1)
    //                 }
    //             }
    //         }

    //         return dp[0]
  }
}
