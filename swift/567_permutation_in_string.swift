class Solution {
  func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    guard s2.count >= s1.count else { return false }

    var curCharCntMap: [Character: Int] = createCharCntMap(of: s1)

    for (idx, char) in s2.enumerated() {
      if idx == s1.count - 1 {
        break
      }

      curCharCntMap[char, default: 0] -= 1

      if curCharCntMap[char] == 0 {
        curCharCntMap.removeValue(forKey: char)
      }
    }

    let sChars: [Character] = Array(s2)

    for leftIdx in 0..<(s2.count - s1.count + 1) {
      let rightIdx: Int = leftIdx + s1.count - 1
      let rightChar: Character = sChars[rightIdx]
      let leftChar: Character = sChars[leftIdx]

      curCharCntMap[rightChar, default: 0] -= 1

      if curCharCntMap[rightChar] == 0 {
        curCharCntMap.removeValue(forKey: rightChar)
      }

      if curCharCntMap.count == 0 {
        return true
      }

      curCharCntMap[leftChar, default: 0] += 1

      if curCharCntMap[leftChar] == 0 {
        curCharCntMap.removeValue(forKey: leftChar)
      }
    }

    return false
  }

  private func createCharCntMap(of str: String) -> [Character: Int] {
    var charCntMap: [Character: Int] = [:]

    for char in str {
      charCntMap[char, default: 0] += 1
    }

    return charCntMap
  }
}
