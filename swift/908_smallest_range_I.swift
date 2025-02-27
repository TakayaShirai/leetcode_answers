class Solution {
  func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
    var maxNum: Int = Int.min
    var minNum: Int = Int.max

    for num in nums {
      maxNum = max(maxNum, num)
      minNum = min(minNum, num)
    }

    return maxNum - minNum > 2 * k ? maxNum - minNum - 2 * k : 0
  }
}
