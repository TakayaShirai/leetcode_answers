class Solution {
  func findLUSlength(_ strs: [String]) -> Int {
    var decOrderStrs: [String] = strs.sorted { $0.count > $1.count }
    var duplicatedStr: Set<String> = getDuplicates(in: strs)

    for (idx, str) in decOrderStrs.enumerated() {
      if !duplicatedStr.contains(str) {
        guard idx != 0 else { return str.count }
        var curIdx: Int = 0

        while curIdx < idx {
          while curIdx < idx && decOrderStrs[curIdx] == decOrderStrs[curIdx + 1] {
            curIdx += 1
          }

          guard !isSubsequence(str, of: decOrderStrs[curIdx]) else { break }
          guard curIdx != idx - 1 else { return str.count }

          curIdx += 1
        }
      }
    }

    return -1
  }

  private func getDuplicates(in strs: [String]) -> Set<String> {
    var duplicatedStrs: Set<String> = []
    var seenStrsSet: Set<String> = []

    for str in strs {
      if seenStrsSet.contains(str) {
        duplicatedStrs.insert(str)
      }

      seenStrsSet.insert(str)
    }

    return duplicatedStrs
  }

  private func isSubsequence(_ str1: String, of str2: String) -> Bool {
    let inputStr1Chars: [Character] = Array(str1)
    var curStr1Idx: Int = 0

    for char in str2 {
      if curStr1Idx < str1.count && inputStr1Chars[curStr1Idx] == char {
        curStr1Idx += 1
      }
    }

    return curStr1Idx == str1.count
  }
}
