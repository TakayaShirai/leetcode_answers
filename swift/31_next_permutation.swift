class Solution {
  func nextPermutation(_ nums: inout [Int]) {
    let pivot = findIndexOfLastPeak(nums) - 1

    if pivot != -1 {
      let nextPrefix = findLastIndexOfGreater(nums, nums[pivot])
      swap(&nums, pivot, nextPrefix)
    }

    reverseSuffix(&nums, pivot + 1)
  }

  private func findIndexOfLastPeak(_ nums: [Int]) -> Int {
    for i in (1..<nums.count).reversed() {
      if nums[i - 1] < nums[i] {
        return i
      }
    }
    return 0
  }

  private func findLastIndexOfGreater(_ nums: [Int], _ threshold: Int) -> Int {
    for i in (0..<nums.count).reversed() {
      if nums[i] > threshold {
        return i
      }
    }
    return -1
  }

  private func reverseSuffix(_ nums: inout [Int], _ start: Int) {
    var start = start
    var end = nums.count - 1
    while start < end {
      swap(&nums, start, end)
      start += 1
      end -= 1
    }
  }

  private func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
  }
}
