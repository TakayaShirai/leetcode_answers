class Solution {
  func detectCapitalUse(_ word: String) -> Bool {
    return isAllUppercase(word) || isOnlyFirstLetterUppercase(word) || isAllLowercase(word)
  }

  private func isAllUppercase(_ word: String) -> Bool {
    for char in word {
      if !char.isUppercase {
        return false
      }
    }

    return true
  }

  private func isOnlyFirstLetterUppercase(_ word: String) -> Bool {
    for (idx, char) in word.enumerated() {
      if idx == 0 {
        if !char.isUppercase {
          return false
        }
      } else {
        if !char.isLowercase {
          return false
        }
      }
    }

    return true
  }

  private func isAllLowercase(_ word: String) -> Bool {
    for char in word {
      if !char.isLowercase {
        return false
      }
    }

    return true
  }
}
