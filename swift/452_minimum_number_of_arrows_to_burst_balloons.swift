class Solution {
  func findMinArrowShots(_ points: [[Int]]) -> Int {
    let sortedPoints: [[Int]] = points.sorted { $0[1] < $1[1] }
    var requiredShotsCnt: Int = 0
    var pointEnd: Int = sortedPoints[0][1]

    for curPoint in sortedPoints {
      let curPointStart: Int = curPoint[0]
      let curPointEnd: Int = curPoint[1]

      guard curPointStart <= pointEnd else {
        requiredShotsCnt += 1
        pointEnd = curPointEnd
        continue
      }
    }

    requiredShotsCnt += 1

    return requiredShotsCnt

    // let sortedPoints: [[Int]] = points.sorted { $0[0] < $1[0] }
    // var requiredShotsCnt: Int = 0
    // var dupRangeStart: Int = sortedPoints[0][0]
    // var dupRangeEnd: Int = sortedPoints[0][1]

    // for point in sortedPoints {
    //   let curPointStart: Int = point[0]
    //   let curPointEnd: Int = point[1]

    //   guard curPointStart <= dupRangeEnd else {
    //     requiredShotsCnt += 1
    //     dupRangeStart = curPointStart
    //     dupRangeEnd = curPointEnd
    //     continue
    //   }

    //   dupRangeStart = curPointStart
    //   dupRangeEnd = min(dupRangeEnd, curPointEnd)
    // }

    // requiredShotsCnt += 1

    // return requiredShotsCnt
  }
}
