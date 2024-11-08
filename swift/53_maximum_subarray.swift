class Solution {
  func maxSubArray(_ nums: [Int]) -> Int {
    var curValue: Int = 0
    var res: Int = -100000

    for num in nums {
      curValue += num

      res = max(curValue, res)

      if curValue < 0 {
        curValue = 0
      }
    }

    return res
  }
}
