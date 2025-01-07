class Solution {
  func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var magCharCntMap: [Character: Int] = createCharCntMap(magazine)

    for char in ransomNote {
      if magCharCntMap[char] != nil {
        if magCharCntMap[char] == 0 {
          return false
        } else {
          magCharCntMap[char]! -= 1
        }
      } else {
        return false
      }
    }

    return true
  }

  private func createCharCntMap(_ str: String) -> [Character: Int] {
    var map: [Character: Int] = [:]

    for char in str {
      map[char, default: 0] += 1
    }

    return map
  }
}
