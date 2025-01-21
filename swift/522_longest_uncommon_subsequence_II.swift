class Solution {
  func findLUSlength(_ strs: [String]) -> Int {
    var sortedStrs: [String] = strs.sorted { $0.count > $1.count }
    var duplicates: Set<String> = getDuplicates(strs)

    for (idx, str) in sortedStrs.enumerated() {
      if !duplicates.contains(str) {
        guard idx != 0 else { return str.count }

        for i in 0..<idx {
          guard !isSubsequence(str, of: sortedStrs[i]) else { break }
          if i == idx - 1 {
            return str.count
          }
        }
      }
    }

    return -1
  }

  private func getDuplicates(_ strs: [String]) -> Set<String> {
    var set: Set<String> = []
    var duplicates: Set<String> = []

    for str in strs {
      if set.contains(str) {
        duplicates.insert(str)
      }

      set.insert(str)
    }

    return duplicates
  }

  private func isSubsequence(_ str1: String, of str2: String) -> Bool {
    let str1Chars: [Character] = Array(str1)
    var str1Idx: Int = 0

    for char in str2 {
      if str1Idx < str1.count && str1Chars[str1Idx] == char {
        str1Idx += 1
      }
    }

    return str1Idx == str1.count
  }
}
