class Solution {
  func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1

    while left <= right {
      let middle: Int = left + (right - left) / 2

      if nums[middle] == target {
        return middle
      } else if nums[middle] > target {
        right = middle - 1
      } else {
        left = middle + 1
      }
    }

    return left
  }
}
