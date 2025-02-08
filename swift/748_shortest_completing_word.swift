class Solution {
  func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
    let lpCharCntMap: [Character: Int] = createCharCntMap(of: licensePlate)
    var shortestCompWord: String? = nil

    for word in words {
      if isCompletingWord(word, of: lpCharCntMap) {
        if shortestCompWord == nil || word.count < shortestCompWord!.count {
          shortestCompWord = word
        }
      }
    }

    return shortestCompWord!
  }

  private func createCharCntMap(of str: String) -> [Character: Int] {
    var charCntMap: [Character: Int] = [:]

    for char in str.lowercased() where char.isLetter {
      charCntMap[char, default: 0] += 1
    }

    return charCntMap
  }

  private func isCompletingWord(_ word: String, of charCntMap: [Character: Int]) -> Bool {
    var curCharMap = charCntMap

    for char in word.lowercased() where char.isLetter {
      if curCharMap[char] != nil {
        curCharMap[char]! -= 1
      }
    }

    for value in curCharMap.values {
      if value > 0 {
        return false
      }
    }

    return true
  }
}
