class Solution {
  func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums.max()! }
    return max(
      helperRob(Array(nums[0...nums.count - 2])), helperRob(Array(nums[1...nums.count - 1])))
  }

  func helperRob(_ nums: [Int]) -> Int {
    var previousMax: Int = 0
    var currentMax: Int = 0

    for num in nums {
      let temp = max(previousMax + num, currentMax)
      previousMax = currentMax
      currentMax = temp
    }

    return currentMax
  }
}
