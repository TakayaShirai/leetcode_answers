class Solution {
  func jump(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return 0 }

    // Greedy
    var searchStartIdx: Int = 0
    var curMaxReach: Int = 0
    var requiredJumps: Int = 0

    while curMaxReach < nums.count - 1 {
      var maxReachCandidate: Int = searchStartIdx

      for curIdx in searchStartIdx...curMaxReach {
        maxReachCandidate = max(maxReachCandidate, nums[curIdx] + curIdx)
      }

      searchStartIdx = curMaxReach + 1
      curMaxReach = maxReachCandidate
      requiredJumps += 1
    }

    return requiredJumps

    // DP
    // var minRequiredJumps: [Int] = Array(repeating: nums.count, count: nums.count)
    // minRequiredJumps[0] = 0

    // for curIdx in 0..<nums.count {
    //   let maxJump: Int = nums[curIdx]

    //   guard maxJump > 0 else { continue }

    //   for jump in 1...maxJump {
    //     guard curIdx + jump < nums.count else { break }
    //     minRequiredJumps[curIdx + jump] = min(minRequiredJumps[curIdx + jump], minRequiredJumps[curIdx] + 1)
    //   }
    // }

    // return minRequiredJumps[nums.count - 1]
  }
}
