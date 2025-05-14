import XCTest

/// An enum to represent the errors that could occur in the method maximumGap.
enum MaximumGapError: Error {
  case invalidInputSizeError
}

class Solution {
  /// Calculates the maximum gap between successive elements in the input array.
  ///
  /// - Parameter nums: An array of integers.
  /// - Returns: The maximum gap between successive elements.
  /// - Throws: `MaximumGapError.invalidInputSizeError` if the input array has fewer than two elements.
  ///           `MaximumGapError.invalidInputContentError` if the array contains invalid content.
  func findMaximumGap(in nums: [Int]) throws -> Int {
    // Ensure the input contains at least two elements to form a gap.
    guard nums.count >= 2 else { throw MaximumGapError.invalidInputSizeError }
    let minNum = nums.min()!  // Safe to force-unwrap .min() here, as 'nums.count >= 2' ensures 'nums' is non-empty.
    let maxNum = nums.max()!  // Safe to force-unwrap .max() here, as 'nums.count >= 2' ensures 'nums' is non-empty.

    // If all numbers are the same, the maximum gap is 0.
    guard maxNum != minNum else { return 0 }

    // Calculate the minimum possible maximum gap.
    // This is the smallest maximum gap that must exist between sorted elements,
    // assuming they are uniformely distributed.
    // We use this value to define the size of the following buckets.
    let minPossibleMaxGap: Int = max(1, (maxNum - minNum) / (nums.count - 1))

    // Calculate the number of buckets needed to span the entire range from minNum to maxNum.
    let bucketsCnt: Int = (maxNum - minNum) / minPossibleMaxGap + 1

    // Initialize arrays to track the min and max value in each bucket.

    // The maximum gap will not be found within a bucket because the range of a bucket is set small.
    // Instead, the max gap must occur between two buckets (between max of one bucket and min of the next).
    // So by storing only the min and max of each non-empty bucket, we can compute the max gap in O(n) time.
    var minNumsBuckets: [Int?] = Array(repeating: nil, count: bucketsCnt)
    var maxNumsBuckets: [Int?] = Array(repeating: nil, count: bucketsCnt)

    // Distribute the numbers into their respective buckets and update the min and max values.
    for curNum in nums {
      let bucketIdx: Int = (curNum - minNum) / minPossibleMaxGap

      if let curMin = minNumsBuckets[bucketIdx], let curMax = maxNumsBuckets[bucketIdx] {
        minNumsBuckets[bucketIdx] = min(curMin, curNum)
        maxNumsBuckets[bucketIdx] = max(curMax, curNum)
      } else {
        minNumsBuckets[bucketIdx] = curNum
        maxNumsBuckets[bucketIdx] = curNum
      }
    }

    var curMaxGap: Int = 0
    var prevMax: Int = minNum

    // Compute the maximum gap by comparing the minimum value of the current non-empty bucket
    // with the maximum value of the previous non-empty bucket.
    for curBucketIdx in 0..<bucketsCnt {
      guard let curMin = minNumsBuckets[curBucketIdx], let curMax = maxNumsBuckets[curBucketIdx]
      else {
        continue
      }

      curMaxGap = max(curMaxGap, curMin - prevMax)
      prevMax = curMax
    }

    return curMaxGap
  }
}

final class MaximumGap: XCTestCase {

  var solution: Solution!

  override func setUp() {
    super.setUp()
    solution = Solution()
  }

  override func tearDown() {
    solution = nil
    super.tearDown()
  }

  func testFindMaximamGapWhenGivenDifferentInputNumbers() {
    do {
      let inputNums: [Int] = [2, 1, 5, 6, 12]
      let expectedRes: Int = 6
      let result: Int = try solution.findMaximumGap(in: inputNums)
      XCTAssertEqual(expectedRes, result, "Expected \(expectedRes), but got \(result).")
    } catch {
      XCTFail("Unexpected error occurred: \(error).")
    }
  }

  func testFindMaximamGapWhenGivenSameInputNumbers() {
    do {
      let inputNums: [Int] = [1, 1, 1]
      let expectedRes: Int = 0
      let result: Int = try solution.findMaximumGap(in: inputNums)
      XCTAssertEqual(expectedRes, result, "Expected \(expectedRes), but got \(result).")
    } catch {
      XCTFail("Unexpected error occurred: \(error).")
    }
  }

  func testFindMaximamGapWhenGivenInvalidInputSizeNumbers() {
    let inputNums: [Int] = [1]

    XCTAssertThrowsError(try solution.findMaximumGap(in: inputNums)) { error in
      if let maximumGapError = error as? MaximumGapError {
        XCTAssertEqual(
          maximumGapError, .invalidInputSizeError,
          "Expected \(MaximumGapError.invalidInputSizeError), but got \(error)")
      } else {
        XCTFail("Unexpected error occurred: \(error).")
      }
    }
  }
}
