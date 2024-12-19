class Solution {
  func strStr(_ haystack: String, _ needle: String) -> Int {
    guard needle.count <= haystack.count else { return -1 }

    let haystackArray = Array(haystack)
    let needleArray = Array(needle)

    for haystackIdx in 0...(haystack.count - needle.count) {
      if isNeedleAtIndex(haystackIdx, haystackArray, needleArray) {
        return haystackIdx
      }
    }

    return -1
  }

  private func isNeedleAtIndex(
    _ haystackIdx: Int,
    _ haystackArray: [Character],
    _ needleArray: [Character]
  ) -> Bool {
    for needleIdx in 0..<needleArray.count {
      if haystackArray[haystackIdx + needleIdx] != needleArray[needleIdx] {
        return false
      }
    }
    return true
  }
}
