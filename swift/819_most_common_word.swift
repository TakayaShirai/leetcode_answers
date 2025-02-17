import XCTest

class Solution {
  /// Returns the most common word in the given paragraph, excluding banned words.
  ///
  /// - Parameters:
  ///   - paragraph: The string of the paragraph to be analyzed.
  ///   - banned: The collection of banned words to exclude from the paragraph.
  /// - Returns: The most common word in the given paragraph.
  func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
    let extractedWords =
      paragraph
      .lowercased()
      .split { !($0.isLetter || $0.isNumber) }
      .map { String($0) }

    var wordCounter: [String: Int] = [:]
    var bannedWordsSet = Set(banned)
    var mostFreqWord: String = ""
    var mostFreqWordCnt: Int = 0

    for word in extractedWords {
      guard !bannedWordsSet.contains(word) else { continue }

      wordCounter[word, default: 0] += 1

      if wordCounter[word]! > mostFreqWordCnt {
        mostFreqWordCnt = wordCounter[word]!
        mostFreqWord = word
      }
    }

    return mostFreqWord
  }
}

class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  func testMostCommonWordWhenGivenSingleWord() {
    let paragraph = "Ball"
    let bannedWords: [String] = ["apple", "doctor"]

    let mostCommonWord: String = solution.mostCommonWord(paragraph, bannedWords)
    XCTAssertEqual(
      mostCommonWord, "ball", "Should return 'ball', but returned \(mostCommonWord) instead.")
  }

  func testMostCommonWordWhenGivenWordsWithOnlySpaces() {
    let paragraph = "Ball ball apple doctor doctor    apple apple"
    let bannedWords: [String] = ["apple", "doctor"]

    let mostCommonWord: String = solution.mostCommonWord(paragraph, bannedWords)
    XCTAssertEqual(
      mostCommonWord, "ball", "Should return 'ball', but returned \(mostCommonWord) instead.")
  }

  func testMostCommonWordWhenGivenWordsWithPunctuations() {
    let paragraph = "Ball? ball apple'; doctor; .doctor,apple,apple!"
    let bannedWords: [String] = ["apple", "doctor"]

    let mostCommonWord: String = solution.mostCommonWord(paragraph, bannedWords)
    XCTAssertEqual(
      mostCommonWord, "ball", "Should return 'ball', but returned \(mostCommonWord) instead.")
  }

  func testMostCommonWordWhenGivenEmptyBannedWords() {
    let paragraph = "Ball? ball apple'; doctor; .doctor,apple,apple!"
    let bannedWords: [String] = []

    let mostCommonWord: String = solution.mostCommonWord(paragraph, bannedWords)
    XCTAssertEqual(
      mostCommonWord, "apple", "Should return 'apple', but returned \(mostCommonWord) instead.")
  }
}
