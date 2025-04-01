class Solution {
  func trailingZeroes(_ n: Int) -> Int {
    var fivesCnt: Int = 0

    for curN in 0...n {
      var curNum: Int = curN

      while curNum > 0 && curNum % 5 == 0 {
        curNum /= 5
        fivesCnt += 1
      }
    }

    return fivesCnt
  }
}
