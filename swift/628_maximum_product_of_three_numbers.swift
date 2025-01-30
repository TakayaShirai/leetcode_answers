class Solution {
  func maximumProduct(_ nums: [Int]) -> Int {
    let numsLen: Int = nums.count
    var sortedNums: [Int] = nums.sorted()
    var includeNegativeMax: Int = sortedNums[0] * sortedNums[1] * sortedNums[numsLen - 1]
    var onlyPositiveMax: Int =
      sortedNums[numsLen - 3] * sortedNums[numsLen - 2] * sortedNums[numsLen - 1]
    return max(includeNegativeMax, onlyPositiveMax)
  }
}
