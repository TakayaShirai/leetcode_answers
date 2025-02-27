class Solution {
  func binaryGap(_ n: Int) -> Int {
    var curN: Int = n
    var maxDistance: Int = 0
    var curDistance: Int = 0

    while curN > 0 {
      let curDigitNum: Int = curN % 2

      if curDigitNum == 0 {
        guard curDistance != 0 else {
          curN /= 2
          continue
        }
        curDistance += 1
      } else if curDistance == 0 {
        curDistance = 1
      } else {
        maxDistance = max(maxDistance, curDistance)
        curDistance = 1
      }

      curN /= 2
    }

    return maxDistance
  }
}
