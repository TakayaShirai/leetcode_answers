class Solution {
  func lengthOfLongestSubstring(_ s: String) -> Int {
    let inputChars: [Character] = Array(s)
    var leftIdx: Int = 0
    var charLastAppearedIdxs: [Character: Int] = [:]
    var longestSubstring: Int = 0

    for (rightIdx, char) in inputChars.enumerated() {
      if let lastAppearedIdx = charLastAppearedIdxs[char], lastAppearedIdx >= leftIdx {
        leftIdx = lastAppearedIdx + 1
      }
      longestSubstring = max(longestSubstring, rightIdx - leftIdx + 1)
      charLastAppearedIdxs[char] = rightIdx
    }

    return longestSubstring
  }
}
