import XCTest

class Solution {
  /// Checks whether the two input strings are isomorphic.
  ///
  /// Two strings str1 and str2 are isomorphic if the characters in str1 can be replaced to get str2.
  /// All occurrences of a character must be replaced with another character while preserving the order of characters.
  /// No two characters may map to the same character, but a character may map to itself.
  ///
  /// - Parameters:
  ///   - str1: The first input string.
  ///   - str2: The second input string.
  /// - Returns: A boolean value indicating whether the two input strings are isomorphic.
  func isIsomorphic(_ str1: String, _ str2: String) -> Bool {
    guard str1.count == str2.count else { return false }

    var str1CharToLastSeenIdxMap: [Character: Int] = [:]
    var str2CharToLastSeenIdxMap: [Character: Int] = [:]

    // For each character pair, verify both characters were last seen at the same position (or neither was seen before).
    // This ensures consistent one-to-one mapping between characters of both strings.
    let unseenIdx: Int = -1

    for (curIdx, (str1Char, str2Char)) in zip(str1, str2).enumerated() {
      guard
        str1CharToLastSeenIdxMap[str1Char, default: unseenIdx]
          == str2CharToLastSeenIdxMap[str2Char, default: unseenIdx]
      else {
        return false
      }
      str1CharToLastSeenIdxMap[str1Char] = curIdx
      str2CharToLastSeenIdxMap[str2Char] = curIdx
    }

    return true
  }
}

class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    solution = Solution()
  }

  override func tearDown() {
    solution = nil
  }

  func testIsIsomorphicWhenGivenDifferentLengthStrings() {
    let str1: String = "abb"
    let str2: String = "aa"
    let isIsomorphic: Bool = solution.isIsomorphic(str1, str2)
    XCTAssertFalse(isIsomorphic, "Expected false, but received \(isIsomorphic).")
  }

  func testIsIsomorphicWhenGivenIsomorphicStrings() {
    let str1: String = "abba"
    let str2: String = "bccb"
    let isIsomorphic: Bool = solution.isIsomorphic(str1, str2)
    XCTAssertTrue(isIsomorphic, "Expected true, but received \(isIsomorphic).")
  }

  func testIsIsomorphicWhenGivenNonIsomorphicStrings() {
    let str1: String = "abb"
    let str2: String = "xyz"
    let isIsomorphic: Bool = solution.isIsomorphic(str1, str2)
    XCTAssertFalse(isIsomorphic, "Expected false, but received \(isIsomorphic).")
  }

  func testIsIsomorphicWhenGivenEmptyStrings() {
    let str1: String = ""
    let str2: String = ""
    let isIsomorphic: Bool = solution.isIsomorphic(str1, str2)
    XCTAssertTrue(isIsomorphic, "Expected true, but received \(isIsomorphic).")
  }
}
