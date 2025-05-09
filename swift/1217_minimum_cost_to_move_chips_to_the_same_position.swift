class Solution {
  func minCostToMoveChips(_ position: [Int]) -> Int {
    var oddPosChipsCnt: Int = 0
    var evenPosChipsCnt: Int = 0

    for curPos in position {
      if curPos % 2 == 0 {
        evenPosChipsCnt += 1
      } else {
        oddPosChipsCnt += 1
      }
    }

    return min(evenPosChipsCnt, oddPosChipsCnt)
  }
}
