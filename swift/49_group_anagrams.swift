class Solution {
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagrams: [[Character: Int]: [String]] = [:]

    for str in strs {
      var count: [Character: Int] = [:]

      for char in str {
        count[char, default: 0] += 1
      }

      anagrams[count, default: []].append(str)
    }

    return Array(anagrams.values)
  }
}
