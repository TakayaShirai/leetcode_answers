class Solution {
  func canJump(_ nums: [Int]) -> Bool {
    var curGoal: Int = nums.count - 1

    for (curIdx, maxJump) in nums.enumerated().reversed() {
      if maxJump + curIdx >= curGoal {
        curGoal = curIdx
      }
    }

    return curGoal == 0

    // var canReachJumpArray: [Bool] = Array(repeating: false, count: nums.count)
    // canReachJumpArray[nums.count - 1] = true

    // for (curIdx, maxJump) in nums.enumerated().reversed() {
    //   for jump in 0...maxJump {
    //     guard curIdx + jump < nums.count else { break }
    //     guard canReachJumpArray[curIdx + jump] else { continue }
    //     canReachJumpArray[curIdx] = true
    //     break
    //   }
    // }

    // return canReachJumpArray[0]
  }
}
