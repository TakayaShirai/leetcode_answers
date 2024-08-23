class Solution {
  func pivotIndex(_ nums: [Int]) -> Int {
    var total: Int = 0

    for num in nums {
      total += num
    }

    var leftSum: Int = 0
    var rightSum: Int = 0

    for i in 0..<nums.count {
      rightSum = total - leftSum - nums[i]

      if leftSum == rightSum {
        return i
      }

      leftSum += nums[i]
    }

    return -1
  }
}
