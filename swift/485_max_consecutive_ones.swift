class Solution {
  func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var curCnt: Int = 0
    var maxCnt: Int = 0

    for num in nums {
      if num == 1 {
        curCnt += 1
      } else {
        maxCnt = max(curCnt, maxCnt)
        curCnt = 0
      }
    }

    maxCnt = max(curCnt, maxCnt)

    return maxCnt
  }
}
