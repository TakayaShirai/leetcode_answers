class Solution {
  func reverseOnlyLetters(_ s: String) -> String {
    var inputChars: [Character] = Array(s)
    var leftIdx: Int = 0
    var rightIdx: Int = inputChars.count - 1

    while leftIdx < rightIdx {
      let isLeftLetter: Bool = inputChars[leftIdx].isLetter
      let isRightLetter: Bool = inputChars[rightIdx].isLetter

      if isLeftLetter && isRightLetter {
        let tmp: Character = inputChars[leftIdx]
        inputChars[leftIdx] = inputChars[rightIdx]
        inputChars[rightIdx] = tmp
        leftIdx += 1
        rightIdx -= 1
      }

      if !isLeftLetter {
        leftIdx += 1
      }

      if !isRightLetter {
        rightIdx -= 1
      }
    }

    return String(inputChars)
  }
}
