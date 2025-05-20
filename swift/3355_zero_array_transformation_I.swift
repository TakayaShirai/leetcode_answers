class Solution {
  func isZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Bool {
    var diffArray: [Int] = Array(repeating: 0, count: nums.count)

    for query in queries {
      let left: Int = query[0]
      let right: Int = query[1]

      diffArray[left] += 1
      guard right + 1 < diffArray.count else { continue }
      diffArray[right + 1] -= 1
    }

    var curDecrement: Int = 0

    for (idx, diff) in diffArray.enumerated() {
      curDecrement += diff
      guard curDecrement >= nums[idx] else { return false }
    }

    return true
  }
}
