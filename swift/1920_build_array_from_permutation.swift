class Solution {
  func buildArray(_ nums: [Int]) -> [Int] {
    var convertedNums: [Int] = Array(repeating: 0, count: nums.count)

    for idx in 0..<nums.count {
      convertedNums[idx] = nums[nums[idx]]
    }

    return convertedNums
  }
}
