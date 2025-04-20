class Solution {
  func strStr(_ haystack: String, _ needle: String) -> Int {
    guard !needle.isEmpty else { return 0 }
    guard haystack.count >= needle.count else { return -1 }

    let needleLen = needle.count
    let haystackLen = haystack.count

    for curIdx in 0...(haystackLen - needleLen) {
      let startIdx: String.Index = haystack.index(haystack.startIndex, offsetBy: curIdx)
      let endIdx: String.Index = haystack.index(startIdx, offsetBy: needleLen)
      let substring = haystack[startIdx..<endIdx]

      guard needle != substring else { return curIdx }
    }

    return -1
  }
}
