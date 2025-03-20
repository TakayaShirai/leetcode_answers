class Solution {
  func heightChecker(_ heights: [Int]) -> Int {
    let maxNum: Int = 100
    var sortedHeights: [Int] = bucketSort(maxNum: maxNum, nums: heights)
    var total: Int = 0

    for (idx, height) in heights.enumerated() {
      if height != sortedHeights[idx] {
        total += 1
      }
    }

    return total
  }

  private func bucketSort(maxNum: Int, nums: [Int]) -> [Int] {
    var buckets: [Int] = Array(repeating: 0, count: maxNum + 1)
    var sortedNums: [Int] = []

    for num in nums {
      buckets[num] += 1
    }

    for (num, count) in buckets.enumerated() {
      for _ in 0..<count {
        sortedNums.append(num)
      }
    }

    return sortedNums
  }
}
