class Solution {
  func sortColors(_ nums: inout [Int]) {
    var startIdx: Int = 0

    for partNum in 0...2 {
      partitionArray(&nums, by: partNum, from: &startIdx, to: nums.count - 1)
    }
  }

  private func partitionArray(
    _ nums: inout [Int], by partNum: Int, from startIdx: inout Int, to lastIdx: Int
  ) {
    guard startIdx < lastIdx else { return }
    var curPartitionIdx: Int = startIdx

    for curIdx in startIdx...lastIdx {
      if nums[curIdx] == partNum {
        nums.swapAt(curIdx, curPartitionIdx)
        curPartitionIdx += 1
      }
    }

    startIdx = curPartitionIdx
  }
}
