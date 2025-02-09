class Solution {
  func findAnagrams(_ s: String, _ p: String) -> [Int] {
    guard s.count >= p.count else { return [] }

    var pCharCntMap: [Character: Int] = createCharCntMap(of: p)
    var fstIdxsOfAnagrams: [Int] = []

    for (idx, char) in s.enumerated() {
      if idx == (p.count - 1) {
        break
      }

      pCharCntMap[char, default: 0] -= 1

      if pCharCntMap[char] == 0 {
        pCharCntMap.removeValue(forKey: char)
      }
    }

    let sChars = Array(s)

    for leftIdx in 0..<(s.count - p.count + 1) {
      let rightIdx: Int = leftIdx + p.count - 1
      let leftChar: Character = sChars[leftIdx]
      let rightChar: Character = sChars[rightIdx]

      pCharCntMap[rightChar, default: 0] -= 1
      if pCharCntMap[rightChar] == 0 {
        pCharCntMap.removeValue(forKey: rightChar)
      }

      if pCharCntMap.count == 0 {
        fstIdxsOfAnagrams.append(leftIdx)
      }

      pCharCntMap[leftChar, default: 0] += 1
      if pCharCntMap[leftChar] == 0 {
        pCharCntMap.removeValue(forKey: leftChar)
      }
    }

    return fstIdxsOfAnagrams
  }

  private func createCharCntMap(of str: String) -> [Character: Int] {
    var charCntMap: [Character: Int] = [:]

    for char in str {
      charCntMap[char, default: 0] += 1
    }

    return charCntMap
  }
}
