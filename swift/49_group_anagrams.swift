class Solution {
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramMap: [[Character: Int]: [String]] = [:]

    for curStr in strs {
      let curStrCharCounter = createCharCounter(of: curStr)
      anagramMap[curStrCharCounter, default: []].append(curStr)
    }

    return Array(anagramMap.values)
  }

  private func createCharCounter(of str: String) -> [Character: Int] {
    var charCounter: [Character: Int] = [:]

    for char in str {
      charCounter[char, default: 0] += 1
    }

    return charCounter
  }
}
