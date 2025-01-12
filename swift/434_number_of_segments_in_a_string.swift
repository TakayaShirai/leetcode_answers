class Solution {
  func countSegments(_ s: String) -> Int {
    let arrayS = Array(s)
    var segmentCnt: Int = 0

    for idx in 0..<arrayS.count {
      if (idx == 0 || arrayS[idx - 1] == " ") && arrayS[idx] != " " {
        segmentCnt += 1
      }
    }

    return segmentCnt
  }
}
