class Solution {
  func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count >= 1 else { return 0 }

    let arrayS = Array(s)

    var hashSet: [Character: Int] = [arrayS[0]: 0]
    var longestLen: Int = 1

    var left: Int = 0

    for right in 1..<arrayS.count {
      if let seenCharIdx = hashSet[arrayS[right]] {
        if seenCharIdx >= left {
          longestLen = max(right - left, longestLen)
          left = seenCharIdx + 1
        }
      }

      longestLen = max(right - left + 1, longestLen)
      hashSet[arrayS[right]] = right
    }

    return longestLen
  }
}
