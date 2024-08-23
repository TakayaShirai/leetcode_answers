class Solution {
  /// twoSum returns the indices of two numbers that add up to the target.
  /// If no such pair exists, returns [-1, -1].
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashT: [Int: Int] = [:]

    for (index, num) in nums.enumerated() {
      if let complementIndex = hashT[target - num] {
        return [index, complementIndex]
      } else {
        hashT[num] = index
      }
    }
    return [-1, -1]
  }
}
