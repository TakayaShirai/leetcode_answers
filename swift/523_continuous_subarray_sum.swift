class Solution {
  func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    var remainderMap: [Int: Int] = [0: -1]
    var curSum = 0
    let minimumSize: Int = 2

    for (curIdx, num) in nums.enumerated() {
      curSum += num
      let remainder = curSum % k

      if let prevIdx = remainderMap[remainder] {
        if curIdx - prevIdx >= minimumSize {
          return true
        }
      } else {
        remainderMap[remainder] = curIdx
      }
    }

    return false
  }
}
