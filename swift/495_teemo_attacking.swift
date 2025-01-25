class Solution {
  func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
    var totalDuration: Int = 0

    for idx in 0..<timeSeries.count {
      if idx == timeSeries.count - 1 {
        totalDuration += duration
      } else {
        let curAttackTime: Int = timeSeries[idx]
        let nextAttackTime: Int = timeSeries[idx + 1]

        totalDuration += min(duration, nextAttackTime - curAttackTime)
      }
    }

    return totalDuration
  }
}
