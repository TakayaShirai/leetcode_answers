class Solution {
  func majorityElement(_ nums: [Int]) -> Int {
    var curNum: Int = nums[0]
    var curCnt: Int = 0

    for num in nums {
      if curNum == num {
        curCnt += 1
      } else {
        curCnt -= 1

        if curCnt < 0 {
          curNum = num
          curCnt = 0
        }
      }
    }

    return curNum
  }
}
