class Solution {
  func summaryRanges(_ nums: [Int]) -> [String] {
    guard nums.count != 0 else { return [] }

    var startIdx: Int = 0
    var endIdx: Int = 0
    var ranges: [String] = []

    while endIdx < nums.count {
      while isNextNumberConsecutive(nums, endIdx) {
        endIdx += 1
      }

      appendCurrentRange(nums, startIdx, endIdx, &ranges)

      startIdx = endIdx + 1
      endIdx = startIdx
    }

    return ranges
  }

  private func isNextNumberConsecutive(_ nums: [Int], _ curIdx: Int) -> Bool {
    guard curIdx < nums.count - 1 else { return false }
    return nums[curIdx] == nums[curIdx + 1] - 1
  }

  private func appendCurrentRange(
    _ nums: [Int], _ startIdx: Int, _ endIdx: Int, _ ranges: inout [String]
  ) {
    guard startIdx <= endIdx && endIdx < nums.count else { return }

    if startIdx == endIdx {
      ranges.append(String(nums[startIdx]))
    } else {
      let range = String(nums[startIdx]) + "->" + String(nums[endIdx])
      ranges.append(range)
    }
  }
}
