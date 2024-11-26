class Solution {
  func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    // sort by start
    let sortedIntervals: [[Int]] = intervals.sorted { $0[0] < $1[0] }
    var removeCnt: Int = 0

    var curEnd: Int = sortedIntervals[0][1]

    for i in 1..<intervals.count {
      if curEnd > sortedIntervals[i][0] {
        curEnd = min(curEnd, sortedIntervals[i][1])
        removeCnt += 1
      } else {
        curEnd = sortedIntervals[i][1]
      }
    }

    return removeCnt

    // sort by end
    // let sortedIntervals: [[Int]] = intervals.sorted { $0[1] < $1[1] }
    // var removeCnt: Int = 0

    // var curEnd: Int = sortedIntervals[0][1]

    // for i in 1..<sortedIntervals.count {
    //   if curEnd > sortedIntervals[i][0] {
    //     removeCnt += 1
    //   } else {
    //     curEnd = sortedIntervals[i][1]
    //   }
    // }

    // return removeCnt
  }
}
