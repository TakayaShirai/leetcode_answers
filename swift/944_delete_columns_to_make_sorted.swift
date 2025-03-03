class Solution {
  func minDeletionSize(_ strs: [String]) -> Int {
    let strs = strs.map { Array($0) }
    var count = 0

    for col in 0..<strs[0].count {
      for row in 1..<strs.count {
        if strs[row][col] < strs[row - 1][col] {
          count += 1
          break
        }
      }
    }

    return count
  }
}
