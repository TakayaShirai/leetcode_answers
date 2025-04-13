class Solution {
  func rotate(_ nums: inout [Int], _ k: Int) {
    let shift = k % nums.count
    guard shift != 0 else { return }
    reverse(&nums, start: 0, end: nums.count - 1)
    reverse(&nums, start: 0, end: shift - 1)
    reverse(&nums, start: shift, end: nums.count - 1)
  }

  private func reverse(_ nums: inout [Int], start: Int, end: Int) {
    var left = start
    var right = end
    while left < right {
      nums.swapAt(left, right)
      left += 1
      right -= 1
    }
  }
}
