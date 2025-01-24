class Solution {
  func arrayPairSum(_ nums: [Int]) -> Int {
    let lowerBound: Int = -10000
    let upperBound: Int = 10000
    let sortedNums: [Int] = bucketSort(nums, lowerBound: lowerBound, upperBound: upperBound)

    // let sortedNums: [Int] = nums.sorted()
    var total: Int = 0

    for (idx, num) in sortedNums.enumerated() {
      if idx % 2 == 0 {
        total += num
      }
    }

    return total
  }

  private func bucketSort(_ nums: [Int], lowerBound: Int, upperBound: Int) -> [Int] {
    var bucket: [Int] = Array(repeating: 0, count: upperBound - lowerBound + 1)
    var sortedArray: [Int] = []

    for num in nums {
      bucket[num - lowerBound] += 1
    }

    for idx in 0..<bucket.count {
      let numCnt: Int = bucket[idx]

      for _ in 0..<numCnt {
        sortedArray.append(idx + lowerBound)
      }
    }

    return sortedArray
  }
}
