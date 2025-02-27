class Solution {
  func isMonotonic(_ nums: [Int]) -> Bool {
    return isMonotoneDecreasing(nums) || isMonotoneIncreasing(nums)
  }

  private func isMonotoneDecreasing(_ nums: [Int]) -> Bool {
    var prevNum: Int = 0

    for (idx, num) in nums.enumerated() {
      if idx == 0 {
        prevNum = num
      } else {
        guard prevNum >= num else { return false }
        prevNum = num
      }
    }

    return true
  }

  private func isMonotoneIncreasing(_ nums: [Int]) -> Bool {
    var prevNum: Int = 0

    for (idx, num) in nums.enumerated() {
      if idx == 0 {
        prevNum = num
      } else {
        guard prevNum <= num else { return false }
        prevNum = num
      }
    }

    return true
  }
}
