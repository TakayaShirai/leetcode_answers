import XCTest

class Solution {
  /// Returns the number of beautiful arrangements that can be formed using numbers 1 through the given maximum.
  ///
  /// A beautiful arrangement is an arrangement that meets either of the following conditions:
  ///   - The number at position ‘i’ (1-based index) is divisible by `i`.
  ///   - The position `i` is divisible by the number at that position.
  ///
  /// - Parameter maxNum: The maximum number used to create beautiful arrangements.
  /// - Returns: The number of beautiful arrangements that can be formed using numbers 1 through the given maximum.
  func countBeautifulArrangements(maxNum: Int) -> Int {
    let firstIdx: Int = 1
    var beautifulArrCnt = 0
    var usedNums = Set<Int>()
    findBeautifulArrangements(
      maxNum: maxNum, curIdx: firstIdx /* 1 */, usedNums: &usedNums,
      beautifulArrCnt: &beautifulArrCnt)
    return beautifulArrCnt
  }

  /// Finds beautiful arrangements recursively using backtracking and by checking all possible arrangements.
  ///
  /// - Parameters:
  ///   - maxNum: The maximum number used to create an arrangement.
  ///   - curIdx: The current index in the arrangement.
  ///   - usedNums: The set of the numbers already used in the arrangement.
  ///   - beautifulArrCnt: The current count of found beautiful arrangements.
  private func findBeautifulArrangements(
    maxNum: Int, curIdx: Int, usedNums: inout Set<Int>, beautifulArrCnt: inout Int
  ) {
    if curIdx > maxNum {
      beautifulArrCnt += 1
      return
    }

    for num in 1...maxNum {
      guard !usedNums.contains(num) else { continue }
      // Check if the current number satisfies the beautiful arrangement condition.
      guard num % curIdx == 0 || curIdx % num == 0 else { continue }

      usedNums.insert(num)
      findBeautifulArrangements(
        maxNum: maxNum, curIdx: curIdx + 1, usedNums: &usedNums, beautifulArrCnt: &beautifulArrCnt)
      usedNums.remove(num)
    }
  }
}

class SolutionTest: XCTestCase {
  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  func testCountBeautifulArrangementsWhenGivenSmallestValue() {
    let inputMaxNum: Int = 1
    let beautifulArrangementCnt: Int = solution.countBeautifulArrangements(maxNum: inputMaxNum)
    let expectedCnt: Int = 1
    XCTAssertEqual(
      beautifulArrangementCnt, expectedCnt,
      "Should return \(expectedCnt), but returned \(beautifulArrangementCnt)."
    )
  }

  func testCountBeautifulArrangementsWhenGivenLargestValue() {
    let inputMaxNum: Int = 15
    let beautifulArrangementCnt: Int = solution.countBeautifulArrangements(maxNum: inputMaxNum)
    let expectedCnt: Int = 24679
    XCTAssertEqual(
      beautifulArrangementCnt, expectedCnt,
      "Should return \(expectedCnt), but returned \(beautifulArrangementCnt)."
    )
  }
}
