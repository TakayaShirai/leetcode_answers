class Solution {
  func hIndex(_ citations: [Int]) -> Int {
    var sortedCitations: [Int] = bucketSort(citations)
    var hIdx: Int = 0

    for (paperCnt, citation) in sortedCitations.enumerated() {
      if citation >= paperCnt + 1 {
        hIdx = min(citation, paperCnt + 1)
      }
    }

    return hIdx
  }

  private func bucketSort(_ nums: [Int]) -> [Int] {
    let maxNum: Int = findMax(in: nums)
    var buckets: [[Int]] = Array(repeating: [], count: maxNum + 1)
    var sortedNums: [Int] = []

    for num in nums {
      buckets[num].append(num)
    }

    for nums in buckets.reversed() {
      guard !nums.isEmpty else { continue }

      for num in nums {
        sortedNums.append(num)
      }
    }

    return sortedNums
  }

  private func findMax(in nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    var maxNum: Int = Int.min

    for num in nums {
      maxNum = max(maxNum, num)
    }

    return maxNum
  }
}
