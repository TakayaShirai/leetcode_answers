class Solution {
  func predictTheWinner(_ nums: [Int]) -> Bool {
    guard nums.count > 1 else { return true }

    let numsLen = nums.count
    var scoreDiff = Array(repeating: Array(repeating: 0, count: numsLen), count: numsLen)

    for idx in 0..<numsLen {
      scoreDiff[idx][idx] = nums[idx]
    }

    for length in 2...numsLen {
      for start in 0...(numsLen - length) {
        let end = start + length - 1
        let pickStart = nums[start] - scoreDiff[start + 1][end]
        let pickEnd = nums[end] - scoreDiff[start][end - 1]
        scoreDiff[start][end] = max(pickStart, pickEnd)
      }
    }

    return scoreDiff[0][numsLen - 1] >= 0
  }
}
