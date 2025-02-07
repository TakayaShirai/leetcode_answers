class Solution {
  func dominantIndex(_ nums: [Int]) -> Int {
    var largestNumIdx: Int = -1
    var largestNum: Int = Int.min
    var secLargestNum: Int = Int.min

    for (idx, num) in nums.enumerated() {
      if num > largestNum {
        largestNumIdx = idx
        secLargestNum = largestNum
        largestNum = num
      } else if num > secLargestNum {
        secLargestNum = num
      }
    }

    return largestNum >= 2 * secLargestNum ? largestNumIdx : -1
  }
}
