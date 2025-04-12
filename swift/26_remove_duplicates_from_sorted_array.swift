class Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    var fillInIdx: Int = 0
    var seenNums = Set<Int>()
    var deletionCnt: Int = 0

    for curIdx in 0..<nums.count {
      let curNum: Int = nums[curIdx]

      guard !seenNums.contains(curNum) else {
        deletionCnt += 1
        continue
      }

      nums[fillInIdx] = curNum
      fillInIdx += 1
      seenNums.insert(curNum)
    }

    return nums.count - deletionCnt
  }
}
