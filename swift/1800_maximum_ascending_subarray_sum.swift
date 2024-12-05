class Solution {
  func maxAscendingSum(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }

    var subArrayMaxSum: Int = nums[0]
    var curSum: Int = nums[0]

    for curIdx in 1..<nums.count {
      let prevNum = nums[curIdx - 1]
      let curNum = nums[curIdx]

      if prevNum < curNum {
        curSum += curNum
      } else {
        subArrayMaxSum = max(subArrayMaxSum, curSum)
        curSum = curNum
      }
    }

    return max(subArrayMaxSum, curSum)
  }
}
