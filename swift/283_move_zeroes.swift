class Solution {
  func moveZeroes(_ nums: inout [Int]) {
    var left: Int = 0

    for right in 0..<nums.count {
      if nums[right] != 0 {
        var tmp = nums[left]
        nums[left] = nums[right]
        nums[right] = tmp
        left += 1
      }
    }
  }
}
