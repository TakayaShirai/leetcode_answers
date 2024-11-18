class Solution {
  func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var newInterval = newInterval
    var newIntervals: [[Int]] = []

    for (idx, interval) in intervals.enumerated() {
      if newInterval[1] < interval[0] {
        newIntervals.append(newInterval)
        newIntervals.append(contentsOf: intervals[idx..<intervals.count])
        return newIntervals
      } else if newInterval[0] > interval[1] {
        newIntervals.append(interval)
      } else {
        let newStart = min(newInterval[0], interval[0])
        let newEnd = max(newInterval[1], interval[1])
        newInterval = [newStart, newEnd]
      }
    }

    newIntervals.append(newInterval)

    return newIntervals
  }
}
