class Solution {
  func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var prefixSums: [Int: Int] = [0: 1]
    var curPrefixSum: Int = 0
    var count: Int = 0

    for num in nums {
      curPrefixSum += num

      let target: Int = curPrefixSum - k
      let subarrayCnt = prefixSums[target] != nil ? prefixSums[target]! : 0
      count += subarrayCnt
      prefixSums[curPrefixSum, default: 0] += 1
    }

    return count
  }
}
