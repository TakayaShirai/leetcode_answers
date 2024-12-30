class Solution {
  func summaryRanges(_ nums: [Int]) -> [String] {
    if nums.count == 0 {
      return []
    }

    if nums.count == 1 {
      return [String(nums[0])]
    }

    var startIdx: Int = 0
    var endIdx: Int = 0
    var ranges: [String] = []

    while endIdx < nums.count {
      while isConsecutive(nums, endIdx) {
        endIdx += 1
      }

      updateRanges(nums, startIdx, endIdx, &ranges)

      startIdx = endIdx + 1
      endIdx = startIdx
    }

    return ranges
  }

  private func isConsecutive(_ nums: [Int], _ idx: Int) -> Bool {
    guard idx < nums.count - 1 else { return false }

    if nums[idx] == nums[idx + 1] - 1 {
      return true
    } else {
      return false
    }
  }

  private func updateRanges(_ nums: [Int], _ startIdx: Int, _ endIdx: Int, _ ranges: inout [String])
  {
    guard startIdx <= endIdx && endIdx < nums.count else { return }

    if startIdx == endIdx {
      ranges.append(String(nums[startIdx]))
    } else {
      let range = String(nums[startIdx]) + "->" + String(nums[endIdx])
      ranges.append(range)
    }

    return
  }
}
