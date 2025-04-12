class Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    let maxCnt: Int = 2

    var curCnt: Int = 0
    var curNum: Int = nums[0]
    var fillInIdx: Int = 0
    var deletionCnt: Int = 0

    for curIdx in 0..<nums.count {
      if nums[curIdx] != curNum {
        curNum = nums[curIdx]
        curCnt = 0
      }

      curCnt += 1

      guard curCnt <= maxCnt else {
        deletionCnt += 1
        continue
      }

      nums[fillInIdx] = curNum
      fillInIdx += 1
    }

    return nums.count - deletionCnt
  }
}
