import XCTest

class Solution {
  /// Returns the shortest completing word for the given license plate from the provided list of words.
  ///
  /// - Parameters:
  ///   - licensePlate: The string to be searched for a completing word.
  ///   - words: The collection of the words to search for a completing word.
  /// - Returns: The shortest completing word of the license plate in words.
  func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
    var shortestCompWord: String? = nil

    for word in words where isCompletingWord(word, of: licensePlate) {
      if shortestCompWord == nil || word.count < shortestCompWord!.count {
        shortestCompWord = word
      }
    }

    return shortestCompWord ?? ""
  }

  /// Returns a boolean value indicating whether the given word is a completing word of the given string.
  ///
  /// - Parameters:
  ///   - word: The word to be checked.
  ///   - target: The reference string containing required characters.
  /// - Returns: The boolean value indicating whether the word is a completing word of the given string.
  private func isCompletingWord(_ word: String, of target: String) -> Bool {
    let wordCharCntMap: [Character: Int] = createAlphaCharCntMap(of: word.lowercased())
    let targetCharCntMap: [Character: Int] = createAlphaCharCntMap(of: target.lowercased())

    for (char, requiredCnt) in targetCharCntMap {
      guard let availableCnt = wordCharCntMap[char] else { return false }
      guard availableCnt >= requiredCnt else { return false }
    }

    return true
  }

  /// Returns a character count hashmap for alphabetical characters in the given string.
  ///
  /// - Parameters:
  ///   - str: The string from which the hashmap is created.
  /// - Returns: The character count hashmap for alphabetical characters.
  private func createAlphaCharCntMap(of str: String) -> [Character: Int] {
    var charCntMap: [Character: Int] = [:]

    for char in str where char != " " && char.isLetter {
      charCntMap[char, default: 0] += 1
    }

    return charCntMap
  }
}

class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  func testShortestCompletingWordWhenGivenAlphaOnlyLicensePlate() {
    let licensePlate = "abcd"
    let words = ["afv", "ahirg", "abbcccdd", "bbacda"]
    let shortestCompWord = solution.shortestCompletingWord(licensePlate, words)
    XCTAssertEqual(
      shortestCompWord, "bbacda",
      "Should return 'bbacda' but it returned \(shortestCompWord) instead.")
  }

  func testShortestCompletingWordWhenGivenLicensePlateContainsSpace() {
    let licensePlate = "a b c d"
    let words = ["afv", "ahirg", "abbcccdd", "bbacda"]
    let shortestCompWord = solution.shortestCompletingWord(licensePlate, words)
    XCTAssertEqual(
      shortestCompWord, "bbacda",
      "Should return 'bbacda' but it returned \(shortestCompWord) instead.")
  }

  func testShortestCompletingWordWhenGivenLicensePlateContainsNumber() {
    let licensePlate = "abc1d2"
    let words = ["afv", "ahirg", "abbcccdd", "bbacda"]
    let shortestCompWord = solution.shortestCompletingWord(licensePlate, words)
    XCTAssertEqual(
      shortestCompWord, "bbacda",
      "Should return 'bbacda' but it returned \(shortestCompWord) instead.")
  }

  func testShortestCompletingWordWhenGivenLicensePlateContainsSpaceAndNums() {
    let licensePlate = "a1b c d"
    let words = ["afv", "ahirg", "abbcccdd", "bbacda"]
    let shortestCompWord = solution.shortestCompletingWord(licensePlate, words)
    XCTAssertEqual(
      shortestCompWord, "bbacda",
      "Should return 'bbacda' but it returned \(shortestCompWord) instead.")
  }
}
