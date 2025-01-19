class Solution {
  func reverseVowels(_ s: String) -> String {
    var inputChars: [Character] = Array(s)

    var left: Int = 0
    var right: Int = s.count - 1

    while left < right {
      left = findFirstVowelIdx(in: inputChars, startingAt: left)
      right = findLastVowelIdx(in: inputChars, startingAt: right)

      if left >= right {
        break
      }

      swapCharacter(in: &inputChars, left, right)

      left += 1
      right -= 1
    }

    return String(inputChars)
  }

  private func isVowel(_ char: Character) -> Bool {
    let vowelSet: Set<String> = ["a", "e", "i", "o", "u"]
    return vowelSet.contains(String(char).lowercased())
  }

  private func findFirstVowelIdx(in inputChars: [Character], startingAt startIdx: Int) -> Int {
    var curIdx: Int = startIdx

    while curIdx < inputChars.count && !isVowel(inputChars[curIdx]) {
      curIdx += 1
    }

    return curIdx
  }

  private func findLastVowelIdx(in inputChars: [Character], startingAt startIdx: Int) -> Int {
    var curIdx: Int = startIdx

    while curIdx > 0 && !isVowel(inputChars[curIdx]) {
      curIdx -= 1
    }

    return curIdx
  }

  private func swapCharacter(in inputChars: inout [Character], _ left: Int, _ right: Int) {
    let tmp: Character = inputChars[left]
    inputChars[left] = inputChars[right]
    inputChars[right] = tmp
  }
}
