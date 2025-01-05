class Solution {
  func reverseVowels(_ s: String) -> String {
    var sArray: [Character] = Array(s)

    var left: Int = 0
    var right: Int = s.count - 1

    while left < right {
      left = findFirstVowelIdx(sArray, left)
      right = findLastVowelIdx(sArray, right)

      if left >= right {
        break
      }

      swapCharacters(&sArray, left, right)

      left += 1
      right -= 1
    }

    return String(sArray)
  }

  private func isVowel(_ char: Character) -> Bool {
    return char == "a" || char == "e" || char == "i" || char == "o" || char == "u"
      || char == "A" || char == "E" || char == "I" || char == "O" || char == "U"
  }

  private func findFirstVowelIdx(_ sArray: [Character], _ startIdx: Int) -> Int {
    var curIdx: Int = startIdx

    while curIdx < sArray.count && !isVowel(sArray[curIdx]) {
      curIdx += 1
    }

    return curIdx
  }

  private func findLastVowelIdx(_ sArray: [Character], _ endIdx: Int) -> Int {
    var curIdx: Int = endIdx

    while curIdx > 0 && !isVowel(sArray[curIdx]) {
      curIdx -= 1
    }

    return curIdx
  }

  private func swapCharacters(_ sArray: inout [Character], _ left: Int, _ right: Int) {
    let tmp: Character = sArray[left]
    sArray[left] = sArray[right]
    sArray[right] = tmp
  }
}
