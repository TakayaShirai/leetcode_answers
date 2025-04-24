class Solution {
  func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
    let sortedArray: [Int] = arr.sorted()
    var minDiffs: [[Int]] = []
    var minDiff: Int = Int.max

    for (curIdx, num) in sortedArray.enumerated() {
      guard curIdx != 0 else { continue }
      minDiff = min(minDiff, num - sortedArray[curIdx - 1])
    }

    for (curIdx, num) in sortedArray.enumerated() {
      guard curIdx != 0 else { continue }
      let curDiff: Int = num - sortedArray[curIdx - 1]

      guard curDiff == minDiff else { continue }
      minDiffs.append([sortedArray[curIdx - 1], num])
    }

    return minDiffs
  }

  private func bucketSort(_ nums: [Int]) -> [Int] {
    let maxNum: Int = findMax(in: nums)
    var buckets: [[Int]] = Array(repeating: [], count: maxNum + 1)
    var sortedNums: [Int] = []

    for num in nums {
      buckets[num].append(num)
    }

    for bucket in buckets {
      for num in bucket {
        sortedNums.append(num)
      }
    }

    return sortedNums
  }

  private func findMax(in nums: [Int]) -> Int {
    var maxNum: Int = Int.min

    for num in nums {
      maxNum = max(maxNum, num)
    }

    return maxNum
  }
}
