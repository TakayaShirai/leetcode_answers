class Solution {
  func rob(_ nums: [Int]) -> Int {
    var previousMax = 0
    var currentMax = 0

    // [previousMax, currentMax, num, ...]
    for num in nums {
      let temp = max(num + previousMax, currentMax)
      previousMax = currentMax
      currentMax = temp
    }

    return currentMax
  }
}
