class Solution {
  func maxSubArray(_ nums: [Int]) -> Int {
    var curSum: Int = 0
    var maxSum: Int = Int.min

    for num in nums {
      curSum += num
      maxSum = max(curSum, maxSum)
      if curSum < 0 { curSum = 0 }
    }

    return maxSum
  }
}
