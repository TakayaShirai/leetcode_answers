class Solution {
  func isPalindrome(_ s: String) -> Bool {
    let lowercasedS = s.lowercased()
    let arrayS = Array(lowercasedS)
    let onlyNumAlphaS: [Character] = removeNonAlphaNum(arrayS)

    return checkPalindrome(onlyNumAlphaS)
  }

  private func checkAlphaNum(_ char: Character) -> Bool {
    return char.isNumber || char.isLetter
  }

  private func removeNonAlphaNum(_ arrayS: [Character]) -> [Character] {
    var onlyAlphaNumChars: [Character] = []

    for char in arrayS {
      if checkAlphaNum(char) {
        onlyAlphaNumChars.append(char)
      }
    }

    return onlyAlphaNumChars
  }

  private func checkPalindrome(_ arrayS: [Character]) -> Bool {
    var left: Int = 0
    var right: Int = arrayS.count - 1

    while left < right {
      if arrayS[left] != arrayS[right] {
        return false
      }

      left += 1
      right -= 1
    }

    return true
  }
}
