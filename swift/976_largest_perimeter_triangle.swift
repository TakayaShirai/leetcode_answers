class Solution {
  func largestPerimeter(_ nums: [Int]) -> Int {
    let sortedNums: [Int] = nums.sorted()
    var maxPerimeter: Int = 0

    for idx in 0..<sortedNums.count {
      guard idx >= 2 else { continue }

      if sortedNums[idx - 2] + sortedNums[idx - 1] > sortedNums[idx] {
        maxPerimeter = sortedNums[idx - 2] + sortedNums[idx - 1] + sortedNums[idx]
      }
    }

    return maxPerimeter
  }
}
