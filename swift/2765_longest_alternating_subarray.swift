class Solution {
  func alternatingSubarray(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return -1 }

    var startIdx: Int = 0
    var lastIdx: Int = 1
    var maxLen: Int = -1
    var expectedDiff: Int = -1

    while lastIdx < nums.count {
      if nums[lastIdx - 1] == nums[lastIdx] + expectedDiff {
        maxLen = max(maxLen, lastIdx - startIdx + 1)
        expectedDiff *= -1
        lastIdx += 1
      } else {
        if lastIdx - startIdx + 1 > 2 {
          startIdx = lastIdx - 1
          lastIdx = startIdx + 1
          expectedDiff = -1
        } else {
          startIdx = lastIdx
          lastIdx = startIdx + 1
        }
      }
    }

    return maxLen
  }
}
