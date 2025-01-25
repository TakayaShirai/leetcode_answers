class Solution {
  func merge(_ intervals: [[Int]]) -> [[Int]] {
    var sortedIntervals: [[Int]] = intervals.sorted { $0[0] < $1[0] }

    var curIntervalLeft: Int = sortedIntervals[0][0]
    var curIntervalRight: Int = sortedIntervals[0][1]

    var mergedIntervals: [[Int]] = []

    for interval in sortedIntervals {
      let nextIntervalLeft: Int = interval[0]
      let nextIntervalRight: Int = interval[1]

      if curIntervalRight >= nextIntervalLeft {
        curIntervalRight = max(curIntervalRight, nextIntervalRight)
      } else {
        mergedIntervals.append([curIntervalLeft, curIntervalRight])
        curIntervalLeft = nextIntervalLeft
        curIntervalRight = nextIntervalRight
      }
    }

    mergedIntervals.append([curIntervalLeft, curIntervalRight])

    return mergedIntervals
  }
}
