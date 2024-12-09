class Solution {
  func isPalindrome(_ s: String) -> Bool {
    let lowercasedS = s.lowercased()
    let arrayS = Array(lowercasedS)
    let onlyAlphaNumArrayS = removeNonAlphaChars(arrayS)

    var leftIdx: Int = 0
    var rightIdx: Int = onlyAlphaNumArrayS.count - 1

    while leftIdx < rightIdx {
      if onlyAlphaNumArrayS[leftIdx] != onlyAlphaNumArrayS[rightIdx] {
        return false
      }

      leftIdx += 1
      rightIdx -= 1
    }

    return true
  }

  private func removeNonAlphaChars(_ charArray: [Character]) -> [Character] {
    var convertedArray: [Character] = []

    for char in charArray {
      if isAlNum(char) {
        convertedArray.append(char)
      }
    }

    return convertedArray
  }

  private func isAlNum(_ char: Character) -> Bool {
    return char.isLetter || char.isNumber
  }
}
