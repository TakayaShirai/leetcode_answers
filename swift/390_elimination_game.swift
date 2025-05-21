class Solution {
  func lastRemaining(_ n: Int) -> Int {
    var headNum: Int = 1
    var gap: Int = 1
    var isLeftToRight: Bool = true
    var remainingNumsCnt: Int = n

    while remainingNumsCnt > 1 {
      if isLeftToRight || remainingNumsCnt % 2 == 1 {
        headNum += gap
      }

      gap *= 2
      remainingNumsCnt /= 2
      isLeftToRight = !isLeftToRight
    }

    return headNum
  }
}
