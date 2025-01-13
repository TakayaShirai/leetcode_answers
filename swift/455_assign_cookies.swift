class Solution {
  func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    var sortedG: [Int] = g.sorted()
    var sortedS: [Int] = s.sorted()

    var contentChildrenCnt: Int = 0

    var sIdx: Int = 0

    for minCookie in sortedG {
      while sIdx < sortedS.count {
        if sortedS[sIdx] >= minCookie {
          contentChildrenCnt += 1
          sIdx += 1
          break
        }

        sIdx += 1
      }
    }

    return contentChildrenCnt
  }
}
