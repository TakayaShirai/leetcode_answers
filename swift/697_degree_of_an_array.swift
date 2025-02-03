class Solution {
  func findShortestSubArray(_ nums: [Int]) -> Int {
    var numMinIdxCntMap: [Int: (count: Int, minIdx: Int)] = [:]
    var maxFreq: Int = 0
    var smallestLen: Int = nums.count

    for (idx, num) in nums.enumerated() {
      if numMinIdxCntMap[num] == nil {
        numMinIdxCntMap[num] = (1, idx)
      } else {
        numMinIdxCntMap[num]!.count += 1
      }

      if numMinIdxCntMap[num]!.count > maxFreq {
        maxFreq = numMinIdxCntMap[num]!.count
        smallestLen = idx - numMinIdxCntMap[num]!.minIdx + 1
      } else if numMinIdxCntMap[num]!.count == maxFreq {
        smallestLen = min(smallestLen, idx - numMinIdxCntMap[num]!.minIdx + 1)
      }
    }

    return smallestLen
  }
}
