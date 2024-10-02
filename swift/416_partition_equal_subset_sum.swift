class Solution {
  func canPartition(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)
    guard sum % 2 == 0 else { return false }

    let halfSum = sum / 2
    var subsets: [Int: Int] = [:]

    for num in nums {
      if num == halfSum {
        return true
      } else if let gap = subsets[halfSum - num] {
        return true
      }

      for key in subsets.keys {
        subsets[num + key] = 1
      }

      subsets[num] = 1
    }

    return false
  }
}
