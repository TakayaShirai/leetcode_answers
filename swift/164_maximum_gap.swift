class Solution {
  func maximumGap(_ nums: [Int]) -> Int {
    guard nums.count >= 2 else { return 0 }

    let minMaxNums: (min: Int, max: Int) = findMinMax(from: nums)
    let minNum: Int = minMaxNums.min
    let maxNum: Int = minMaxNums.max

    guard minNum != maxNum else { return 0 }

    let numsLen: Int = nums.count

    let bucketSize: Int = max(1, (maxNum - minNum) / (numsLen - 1))
    let bucketCnt: Int = (maxNum - minNum) / bucketSize + 1

    var minBuckets: [Int] = Array(repeating: Int.max, count: bucketCnt)
    var maxBuckets: [Int] = Array(repeating: Int.min, count: bucketCnt)
    var filledBuckets: [Bool] = Array(repeating: false, count: bucketCnt)

    for num in nums {
      let bucketIdx: Int = (num - minNum) / bucketSize
      minBuckets[bucketIdx] = min(minBuckets[bucketIdx], num)
      maxBuckets[bucketIdx] = max(maxBuckets[bucketIdx], num)
      filledBuckets[bucketIdx] = true
    }

    var maxGap: Int = 0
    var prevMax: Int = minNum

    for curBucketIdx in 0..<bucketCnt {
      guard filledBuckets[curBucketIdx] else { continue }

      maxGap = max(maxGap, minBuckets[curBucketIdx] - prevMax)
      prevMax = maxBuckets[curBucketIdx]
    }

    return maxGap
  }

  private func findMinMax(from nums: [Int]) -> (min: Int, max: Int) {
    var maxNum: Int = Int.min
    var minNum: Int = Int.max

    for num in nums {
      minNum = min(num, minNum)
      maxNum = max(num, maxNum)
    }

    return (min: minNum, max: maxNum)
  }
}
