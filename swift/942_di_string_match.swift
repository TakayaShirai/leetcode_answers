class Solution {
  func diStringMatch(_ s: String) -> [Int] {
    var remainingMaxVal: Int = s.count
    var remainingMinVal: Int = 0
    var curPerm: [Int] = []

    for char in s {
      switch char {
      case "I":
        curPerm.append(remainingMinVal)
        remainingMinVal += 1
      case "D":
        curPerm.append(remainingMaxVal)
        remainingMaxVal -= 1
      default:
        return curPerm
      }
    }

    curPerm.append(remainingMinVal)

    return curPerm
  }
}
