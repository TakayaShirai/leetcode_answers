class Solution {
  func findMin(_ nums: [Int]) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1
    var mid: Int = 0

    while left < right {
      mid = (left + right) / 2

      if nums[mid] > nums[right] {
        left = mid + 1
      } else {
        right = mid
      }
    }

    return nums[left]
  }
}
