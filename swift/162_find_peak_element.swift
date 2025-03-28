class Solution {
  func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1

    while left <= right {
      let mid = left + (right - left) / 2

      if isPeak(idx: mid, nums: nums) {
        return mid
      }

      if mid < nums.count - 1 && nums[mid] < nums[mid + 1] {
        left = mid + 1
      } else {
        right = mid - 1
      }
    }

    return -1
  }

  private func isPeak(idx: Int, nums: [Int]) -> Bool {
    guard idx != 0 else {
      return nums.count == 1 || nums[0] > nums[1]
    }

    guard idx != nums.count - 1 else {
      return nums[nums.count - 1] > nums[nums.count - 2]
    }

    return nums[idx - 1] < nums[idx] && nums[idx] > nums[idx + 1]
  }
}
