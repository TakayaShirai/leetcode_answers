class Solution {
  func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    guard nums.count >= k else { return -1.0 }

    // Sliding Window
    var curSum: Int = calcFirstKValueSum(nums, k)
    var maxSubarraySum: Int = curSum

    for curIdx in k..<nums.count {
      curSum = curSum - nums[curIdx - k] + nums[curIdx]
      maxSubarraySum = max(maxSubarraySum, curSum)
    }

    return Double(maxSubarraySum) / Double(k)

    // Prefix Sum
    // var prefixSum: [Int] = [0]

    // var curSum: Int = 0
    // var maxAve: Double = Double(Int.min)

    // for (idx, num) in nums.enumerated() {
    //     curSum += num

    //     if idx >= k - 1 {
    //         let curSubarrayTotal = curSum - prefixSum[idx - k + 1]
    //         maxAve = max(maxAve, Double(curSubarrayTotal) / Double(k))
    //     }

    //     prefixSum.append(curSum)
    // }

    // return maxAve
  }

  private func calcFirstKValueSum(_ nums: [Int], _ k: Int) -> Int {
    guard nums.count >= k else { return -1 }

    var curSum: Int = 0
    for i in 0..<k {
      curSum += nums[i]
    }

    return curSum
  }
}
