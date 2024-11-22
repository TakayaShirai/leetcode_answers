class Solution {
  func merge(_ intervals: [[Int]]) -> [[Int]] {
    var sortedIntervals: [[Int]] = intervals.sorted { $0[0] < $1[0] }
    var mergedIntervals: [[Int]] = []

    var start: Int = sortedIntervals[0][0]
    var end: Int = sortedIntervals[0][1]

    for i in 1..<intervals.count {
      if end < sortedIntervals[i][0] {
        mergedIntervals.append([start, end])
        start = sortedIntervals[i][0]
        end = sortedIntervals[i][1]
      } else {
        end = max(end, sortedIntervals[i][1])
      }
    }

    mergedIntervals.append([start, end])

    return mergedIntervals
  }
}
