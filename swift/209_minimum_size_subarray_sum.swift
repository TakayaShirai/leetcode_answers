class Solution {
  func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var left: Int = 0
    var curSum: Int = 0
    var minLen: Int = nums.count + 1

    for right in 0..<nums.count {
      curSum += nums[right]

      while curSum >= target {
        minLen = min(minLen, right - left + 1)
        curSum -= nums[left]
        left += 1
      }
    }

    return minLen == nums.count + 1 ? 0 : minLen
  }
}
