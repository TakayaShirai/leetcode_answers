class NumArray {
  private var prefixSum: [Int]

  init(_ nums: [Int]) {
    self.prefixSum = []
    self.prefixSum = createPrefixSum(nums)
  }

  func sumRange(_ left: Int, _ right: Int) -> Int {
    if left == 0 {
      return prefixSum[right]
    } else {
      return prefixSum[right] - prefixSum[left - 1]
    }

    // var curSum: Int = 0

    // for idx in left...right {
    //     curSum += nums[idx]
    // }

    // return curSum
  }

  private func createPrefixSum(_ nums: [Int]) -> [Int] {
    var curSum: Int = 0
    var prefixSum: [Int] = Array(repeating: 0, count: nums.count)

    for (idx, num) in nums.enumerated() {
      curSum += num
      prefixSum[idx] = curSum
    }

    return prefixSum
  }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
