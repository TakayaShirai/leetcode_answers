class Solution {
  func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count == 0 {
      return 0
    }

    var left: String.Index = s.startIndex
    var right: String.Index = s.index(after: left)

    var seenChars: [Character: String.Index] = [s[s.startIndex]: s.startIndex]

    var maxLength: Int = 1

    while right < s.endIndex {
      if let duplicateIndex = seenChars[s[right]], duplicateIndex >= left {
        left = s.index(after: duplicateIndex)
      }

      seenChars[s[right]] = right

      maxLength = max(maxLength, s.distance(from: left, to: right) + 1)

      right = s.index(after: right)
    }

    return maxLength
  }
}
