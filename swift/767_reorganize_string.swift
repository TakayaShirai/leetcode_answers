import HeapModule
import XCTest

/// A struct representing a character and its count in a string.
struct CharCount: Comparable {
  let char: Character
  let count: Int

  static func == (lhs: CharCount, rhs: CharCount) -> Bool {
    return lhs.count == rhs.count
  }

  static func < (lhs: CharCount, rhs: CharCount) -> Bool {
    return lhs.count < rhs.count
  }
}

class Solution {

  /// The enum of errors that can occur while reorganizing a string.
  public enum ReorganizeError: Error {
    case cannotReorganizeStringError
  }

  /// Reorganizes the given string so that no two adjacent characters are the same.
  ///
  /// - Parameter str: The given string to reorganize.
  /// - Returns: The result of reorganizing the given string.
  func reorganizeString(_ str: String) -> Result<String, ReorganizeError> {
    let charCounter: [Character: Int] = createCharCounter(of: str)
    var maxHeap = Heap<CharCount>()
    let maxAllowedCharCount: Int = (str.count + 1) / 2

    for (char, count) in charCounter {
      // Verify that each character's count does not exceed the maximum allowed character count for a valid reorganization.
      guard count <= maxAllowedCharCount else {
        return .failure(ReorganizeError.cannotReorganizeStringError)
      }
      let charCnt: CharCount = CharCount(char: char, count: count)
      maxHeap.insert(charCnt)
    }

    var reorganizedString: String = ""
    var prevCharCnt: CharCount? = nil

    while !maxHeap.isEmpty {
      let curCharCnt: CharCount = maxHeap.popMax()!
      let curChar: Character = curCharCnt.char
      let curCnt: Int = curCharCnt.count

      reorganizedString.append(curChar)

      if let prev = prevCharCnt, prev.count > 0 {
        maxHeap.insert(prev)
      }

      prevCharCnt = CharCount(char: curChar, count: curCnt - 1)
    }

    guard reorganizedString.count == str.count else {
      return .failure(ReorganizeError.cannotReorganizeStringError)
    }

    return .success(reorganizedString)
  }

  /// Creates a character counter of the given string.
  ///
  /// - Parameter str: The given string whose character counter to be created.
  /// - Returns: The character counter of the given string.
  private func createCharCounter(of str: String) -> [Character: Int] {
    var charCounter: [Character: Int] = [:]

    for char in str {
      charCounter[char, default: 0] += 1
    }

    return charCounter
  }
}

class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  func testReorganizeStringWhenGivenReorganizableString() {
    let reorganizableString: String = "aaabb"
    let reorganizeResult = solution.reorganizeString(reorganizableString)

    switch reorganizeResult {
    case .success(let reorganizedString):
      XCTAssertEqual(
        reorganizedString.count, reorganizableString.count,
        "The reorganized string should have the same length as the original string, but got length \(reorganizedString.count) instead of expected \(reorganizableString.count)."
      )

      let reorganizedChars: [Character] = Array(reorganizedString)

      for curIdx in 1..<reorganizedString.count {
        let prevIdx: Int = curIdx - 1
        XCTAssertNotEqual(
          reorganizedChars[prevIdx], reorganizedChars[curIdx],
          "Adjacent characters should not be the same, but found '\(reorganizedChars[prevIdx])' at positions \(prevIdx) and \(curIdx)."
        )
      }
    case .failure:
      XCTFail("Should be able to reorganize \(reorganizableString), but failed reorganizing.")
    }
  }

  func testReorganizeStringWhenGivenNonReorganizableString() {
    let nonReorganizableString: String = "aaaabb"
    let reorganizeResult = solution.reorganizeString(nonReorganizableString)
    let expectedError = Solution.ReorganizeError.cannotReorganizeStringError

    switch reorganizeResult {
    case .success(let reorganizedString):
      XCTFail(
        "String '\(nonReorganizableString)' should not be reorganizable, but returned '\(reorganizedString)'."
      )
    case .failure(let error):
      XCTAssertEqual(error, expectedError, "Expected error '\(expectedError)', but got '\(error)'.")
    }
  }
}
