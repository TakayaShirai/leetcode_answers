class Solution {
  func checkRecord(_ s: String) -> Bool {
    var totalAbsentCnt: Int = 0
    var totalConsecutiveLateCnt: Int = 0

    let maxTotalAbsentCnt: Int = 1
    let maxTotalConsecutiveLateCnt: Int = 2

    for record in s {
      switch record {
      case "A":
        totalAbsentCnt += 1
        totalConsecutiveLateCnt = 0
        guard totalAbsentCnt <= maxTotalAbsentCnt else { return false }
      case "L":
        totalConsecutiveLateCnt += 1
        guard totalConsecutiveLateCnt <= maxTotalConsecutiveLateCnt else { return false }
      case "P":
        totalConsecutiveLateCnt = 0
      default:
        continue
      }
    }

    return true
  }
}
