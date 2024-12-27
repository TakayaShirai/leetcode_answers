class Solution {
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let start: Int = findStart(nums, target)
    let end: Int = findEnd(nums, target)

    return [start, end]
  }

  private func findStart(_ nums: [Int], _ target: Int) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1

    while left <= right {
      let mid = left + (right - left) / 2

      if nums[mid] == target {
        if mid == 0 || nums[mid - 1] != target {
          return mid
        } else {
          right = mid - 1
        }
      } else if nums[mid] < target {
        left = mid + 1
      } else {
        right = mid - 1
      }
    }

    return -1
  }

  private func findEnd(_ nums: [Int], _ target: Int) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1

    while left <= right {
      let mid = left + (right - left) / 2

      if nums[mid] == target {
        if mid == nums.count - 1 || nums[mid + 1] != target {
          return mid
        } else {
          left = mid + 1
        }
      } else if nums[mid] < target {
        left = mid + 1
      } else {
        right = mid - 1
      }
    }

    return -1
  }
}
