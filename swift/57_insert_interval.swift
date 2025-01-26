class Solution {
  func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var insertedIntervals: [[Int]] = []
    var nonInsertedInterval: [Int] = newInterval
    var isNonIntervalInserted: Bool = false

    for interval in intervals {
      if isIntervalOverlapped(interval, nonInsertedInterval) {
        nonInsertedInterval = [
          min(interval[0], nonInsertedInterval[0]), max(interval[1], nonInsertedInterval[1]),
        ]
      } else if nonInsertedInterval[1] < interval[0] && !isNonIntervalInserted {
        insertedIntervals.append(nonInsertedInterval)
        insertedIntervals.append(interval)
        isNonIntervalInserted = true
      } else {
        insertedIntervals.append(interval)
      }
    }

    if !isNonIntervalInserted {
      insertedIntervals.append(nonInsertedInterval)
    }

    return insertedIntervals
  }

  private func isIntervalOverlapped(_ interval1: [Int], _ interval2: [Int]) -> Bool {
    let firstInterval: [Int] = interval1[0] < interval2[0] ? interval1 : interval2
    let secondInterval: [Int] = interval1[0] < interval2[0] ? interval2 : interval1
    return firstInterval[1] >= secondInterval[0]
  }
}
