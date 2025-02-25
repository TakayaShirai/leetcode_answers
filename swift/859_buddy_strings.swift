import XCTest

class Solution {
  /// Return a boolean value indicating whether the two given strings can become identical
  /// by swapping two charactes.
  ///
  /// - Parameters:
  ///   - s: The first input string.
  ///   - goal: The string to compare with the given string s.
  /// - Returns: The boolean value indicating whether they can be identical by swapping two characters.
  func buddyStrings(_ s: String, _ goal: String) -> Bool {
    guard s.count == goal.count else { return false }

    if s == goal {
      // Checks if the string s has duplicates.
      return Set(s).count < s.count
    } else {
      return canSwapExactlyTwoChars(s, goal)
    }
  }

  /// Check if the given two strings can become identical by swapping exactly two different characters.
  ///
  /// - Parameters:
  ///   - str1: The first input string.
  ///   - str2: The second input string.
  /// - Returns: The boolean value indicating if the given strings can become identical.
  private func canSwapExactlyTwoChars(_ str1: String, _ str2: String) -> Bool {
    let requiredSwapCnt: Int = 2
    var diffChars: [[Character]] = []

    for (str1Char, str2Char) in zip(str1, str2) where str1Char != str2Char {
      diffChars.append([str1Char, str2Char])
      guard diffChars.count <= requiredSwapCnt else { return false }
    }

    // Check if exactly two characters differ and if swapping them makes the strings identical.
    return diffChars.count == requiredSwapCnt && diffChars[0] == diffChars[1].reversed()
  }
}

class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  func testBuddyStringsWhenGivenIdenticalStringsWithDuplicates() {
    let s: String = "abcdea"
    let goal: String = "abcdea"
    let isBuddyStrings: Bool = solution.buddyStrings(s, goal)
    XCTAssertEqual(isBuddyStrings, true, "Should return 'true' but returned 'false'.")
  }

  func testBuddyStringsWhenGivenIdenticalStringsWithoutDuplicates() {
    let s: String = "abcde"
    let goal: String = "abcde"
    let isBuddyStrings: Bool = solution.buddyStrings(s, goal)
    XCTAssertEqual(isBuddyStrings, false, "Should return 'false' but returned 'true'.")
  }

  func testBuddyStringsWhenGivenTwoCharactersDifferingStrings() {
    let s: String = "abcde"
    let goal: String = "adcbe"
    let isBuddyStrings: Bool = solution.buddyStrings(s, goal)
    XCTAssertEqual(isBuddyStrings, true, "Should return 'true' but returned 'false'.")
  }

  func testBuddyStringsWhenGivenMoreThanTwoCharactersDifferingStrings() {
    let s: String = "abcde"
    let goal: String = "abecd"
    let isBuddyStrings: Bool = solution.buddyStrings(s, goal)
    XCTAssertEqual(isBuddyStrings, false, "Should return 'false' but returned 'true'.")
  }
}
