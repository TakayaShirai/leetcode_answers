class Solution {
  func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
    let separationCnt: Int = 3
    let sum: Int = arr.reduce(0, +)

    guard abs(sum) % separationCnt == 0 else { return false }
    let subarrSum: Int = sum / separationCnt
    var curSubarrSum: Int = 0
    var subarrCnt: Int = 0

    for num in arr {
      curSubarrSum += num

      if curSubarrSum == subarrSum {
        curSubarrSum = 0
        subarrCnt += 1
      }
    }

    return subarrCnt >= separationCnt
  }
}
