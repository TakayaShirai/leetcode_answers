class Solution {
  func isIsomorphic(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }

    var sPrevSeenIdxMap: [Character: Int] = [:]
    var tPrevSeenIdxMap: [Character: Int] = [:]

    for (curIdx, (sChar, tChar)) in zip(s, t).enumerated() {
      guard sPrevSeenIdxMap[sChar, default: -1] == tPrevSeenIdxMap[tChar, default: -1] else {
        return false
      }

      sPrevSeenIdxMap[sChar] = curIdx
      tPrevSeenIdxMap[tChar] = curIdx
    }

    return true
  }
}
