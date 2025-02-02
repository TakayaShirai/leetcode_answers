class Solution {
  func findMin(_ nums: [Int]) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1

    while left < right {
      let mid: Int = left + (right - left) / 2

      if nums[mid] > nums[right] {
        left = mid + 1
      } else {
        right = mid
      }
    }

    return nums[left]
  }
}
