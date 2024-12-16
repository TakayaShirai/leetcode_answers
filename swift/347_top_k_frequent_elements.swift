class Solution {
  func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let numCntMap: [Int: Int] = createNumCntMap(nums)
    let numCntBuckets: [[Int]] = createNumCntBuckets(nums.count, numCntMap)

    var topKFreqNums: [Int] = []

    for bucket in numCntBuckets {
      if !bucket.isEmpty {
        for num in bucket {
          topKFreqNums.append(num)
          if topKFreqNums.count == k {
            return topKFreqNums
          }
        }
      }
    }

    return topKFreqNums
  }

  private func createNumCntMap(_ nums: [Int]) -> [Int: Int] {
    var numCntMap: [Int: Int] = [:]

    for num in nums {
      numCntMap[num, default: 0] += 1
    }

    return numCntMap
  }

  private func createNumCntBuckets(_ numsCount: Int, _ numCntMap: [Int: Int]) -> [[Int]] {
    var buckets: [[Int]] = Array(repeating: [], count: numsCount + 1)

    for (key, value) in numCntMap {
      buckets[value].append(key)
    }

    return buckets.reversed()
  }
}
