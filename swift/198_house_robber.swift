class Solution {
  func rob(_ nums: [Int]) -> Int {
    var maxProfits: [Int] = Array(repeating: 0, count: nums.count)

    for (curIdx, num) in nums.enumerated() {
      let profitTwoHousesBack: Int = curIdx - 2 >= 0 ? maxProfits[curIdx - 2] : 0
      let profitOneHousesBack: Int = curIdx - 1 >= 0 ? maxProfits[curIdx - 1] : 0
      maxProfits[curIdx] = max(nums[curIdx] + profitTwoHousesBack, profitOneHousesBack)
    }

    return maxProfits[nums.count - 1]
  }
}
