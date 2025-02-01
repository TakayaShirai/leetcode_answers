class Solution {
  func findLengthOfLCIS(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }

    var leftIdx: Int = 0
    var maxSubseqLen: Int = 1

    for rightIdx in 1..<nums.count {
      if nums[rightIdx - 1] < nums[rightIdx] {
        maxSubseqLen = max(maxSubseqLen, rightIdx - leftIdx + 1)
      } else {
        leftIdx = rightIdx
      }
    }

    return maxSubseqLen
  }
}
