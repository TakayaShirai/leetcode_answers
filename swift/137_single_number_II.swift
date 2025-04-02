import XCTest

/// Errors that can occur during findSingleNumber operations.
public enum FindSingleNumberError: Error {
  case emptyInputArrayError
  case invalidInputArraySizeError
}

class Solution {
  /// Finds the number that appears exactly once in the given array where all other elements appear exactly three times.
  ///
  /// - Parameter nums: The array of integers where one element appears once and all others appear exactly three times.
  /// - Returns: The integer that appears only once in the array.
  /// - Throws: A FindSingleNumberError if the given array is empty or if the array size is not 3n + 1.
  func findSingleNumber(in nums: [Int]) throws -> Int {
    guard !nums.isEmpty else { throw FindSingleNumberError.emptyInputArrayError }
    let bitsInInt: Int = 32
    let appearanceCnt: Int = 3
    let maskBit: Int = 1
    var singleNum: Int = 0

    guard (nums.count - 1) % appearanceCnt == 0 else {
      throw FindSingleNumberError.invalidInputArraySizeError
    }

    for bitPos in 0..<bitsInInt {
      var bitCnt = 0
      let mask = maskBit << bitPos
      // Counts how many numbers have the current bit position set.
      for num in nums {
        if num & mask != 0 {
          bitCnt += 1
        }
      }

      // If the bit count is not divisible by appearanceCnt, this bit belongs to the single number.
      if bitCnt % appearanceCnt != 0 {
        singleNum |= mask
      }
    }

    // Handle two's complement representation for negative numbers.
    // If the highest bit is set, treat the number as negative.
    if singleNum >= (maskBit << (bitsInInt - 1)) {
      singleNum -= (maskBit << bitsInInt)
    }
    return singleNum
  }
}

final class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    solution = Solution()
  }

  override func tearDown() {
    solution = nil
  }

  func testFindSingleNumberWhenGivenPositiveSingleNumber() throws {
    let inputArray: [Int] = [1, 1, 1, 2, 2, 3, 2]
    let expectedResult: Int = 3
    let returnedResult: Int = try XCTUnwrap(
      solution.findSingleNumber(in: inputArray),
      "Expected a valid number from findSingleNumber(in:), but received nil.")
    XCTAssertEqual(
      returnedResult, expectedResult,
      "Expected result \(expectedResult), but received \(returnedResult).")
  }

  func testFindSingleNumberWhenGivenNegativeSingleNumber() throws {
    let inputArray: [Int] = [1, 1, 1, 2, 2, -3, 2]
    let expectedResult: Int = -3
    let returnedResult: Int = try XCTUnwrap(
      solution.findSingleNumber(in: inputArray),
      "Expected a valid number from findSingleNumber(in:), but received nil.")
    XCTAssertEqual(
      returnedResult, expectedResult,
      "Expected result \(expectedResult), but received \(returnedResult).")
  }

  func testFindSingleNumberWhenGivenEmptyArray() {
    let inputArray: [Int] = []
    let expectedError: FindSingleNumberError = .emptyInputArrayError
    XCTAssertThrowsError(try solution.findSingleNumber(in: inputArray)) { error in
      guard let returnedError = error as? FindSingleNumberError else {
        XCTFail("Expected FindSingleNumberError, but received \(error).")
        return
      }
      XCTAssertEqual(
        expectedError, returnedError,
        "Expected error \(expectedError), but received \(returnedError).")
    }
  }

  func testFindSingleNumberWhenGivenInvalidSizeArray() {
    let inputArray: [Int] = [1, 1, 1, 2, 2]
    let expectedError: FindSingleNumberError = .invalidInputArraySizeError
    XCTAssertThrowsError(try solution.findSingleNumber(in: inputArray)) { error in
      guard let returnedError = error as? FindSingleNumberError else {
        XCTFail("Expected FindSingleNumberError, but received \(error).")
        return
      }
      XCTAssertEqual(
        expectedError, returnedError,
        "Expected error \(expectedError), but received \(returnedError).")
    }
  }
}
