class Solution {
  func maximalSquare(_ matrix: [[Character]]) -> Int {
    var maxSideLens: [[Int]] = Array(
      repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    var maxSideLen: Int = 0

    for row in 0..<matrix.count {
      for col in 0..<matrix[0].count {
        guard matrix[row][col] != "0" else { continue }

        guard row != 0 && col != 0 else {
          maxSideLens[row][col] = 1
          maxSideLen = max(maxSideLen, maxSideLens[row][col])
          continue
        }

        let left: Int = maxSideLens[row][col - 1]
        let up: Int = maxSideLens[row - 1][col]
        let diag: Int = maxSideLens[row - 1][col - 1]

        maxSideLens[row][col] = min(min(left, up), diag) + 1
        maxSideLen = max(maxSideLen, maxSideLens[row][col])
      }
    }

    return maxSideLen * maxSideLen
  }
}
