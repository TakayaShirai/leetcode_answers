class Solution {
  func findLHS(_ nums: [Int]) -> Int {
    // HashMap
    let numToCntMap: [Int: Int] = countElements(in: nums)
    var longestHS: Int = 0

    for (key, keyNumCnt) in numToCntMap {
      guard let diffOneNumCnt = numToCntMap[key - 1] else { continue }
      longestHS = max(longestHS, keyNumCnt + diffOneNumCnt)
    }

    return longestHS

    // TL Exceeded
    // var longestHS: Int = 0
    // var minVal: Int = Int.max
    // var maxVal: Int = Int.min

    // backtrack(nums: nums, idx: 0, curLen: 1, longestHS: &longestHS, minVal: &minVal, maxVal: &maxVal)

    // return longestHS
  }

  private func countElements(in nums: [Int]) -> [Int: Int] {
    var numToCntMap: [Int: Int] = [:]

    for num in nums {
      numToCntMap[num, default: 0] += 1
    }

    return numToCntMap
  }

  private func backtrack(
    nums: [Int], idx: Int, curLen: Int, longestHS: inout Int, minVal: inout Int, maxVal: inout Int
  ) {
    guard idx < nums.count else { return }

    let tmpMinVal: Int = minVal
    let tmpMaxVal: Int = maxVal

    minVal = min(minVal, nums[idx])
    maxVal = max(maxVal, nums[idx])

    if maxVal - minVal == 1 {
      longestHS = max(curLen, longestHS)
    }

    backtrack(
      nums: nums, idx: idx + 1, curLen: curLen + 1, longestHS: &longestHS, minVal: &minVal,
      maxVal: &maxVal)

    minVal = tmpMinVal
    maxVal = tmpMaxVal

    backtrack(
      nums: nums, idx: idx + 1, curLen: curLen, longestHS: &longestHS, minVal: &minVal,
      maxVal: &maxVal)
  }
}
