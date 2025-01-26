class Solution {
  func reverseWords(_ s: String) -> String {
    let separatedWords = s.split(separator: " ")
    var reversedWords: [String] = []

    for word in separatedWords {
      let revWord: String = reverseWord(String(word))
      reversedWords.append(revWord)
    }

    return reversedWords.joined(separator: " ")
  }

  private func reverseWord(_ str: String) -> String {
    var inputChars: [Character] = Array(str)

    var left: Int = 0
    var right: Int = str.count - 1

    while left < right {
      let tmp: Character = inputChars[left]
      inputChars[left] = inputChars[right]
      inputChars[right] = tmp

      left += 1
      right -= 1
    }

    return String(inputChars)
  }
}
