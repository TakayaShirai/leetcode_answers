class Solution {
  func canJump(_ nums: [Int]) -> Bool {
    // Greedy solution
    var goal = nums.count - 1

    for i in (0..<nums.count - 1).reversed() {
      if nums[i] + i >= goal {
        goal = i
      }
    }

    return goal == 0 ? true : false

    // DP solution
    //         var dp  = Array(repeating: false, count: nums.count)

    //         dp[nums.count-1] = true

    //         for i in (0..<nums.count-1).reversed() {
    //             for jump in (1..<nums[i]+1).reversed() {
    //                 if jump + i >= nums.count-1 || dp[jump+i] == true {
    //                     dp[i] = true
    //                     break
    //                 }
    //             }
    //         }

    //         return dp[0]
  }
}
