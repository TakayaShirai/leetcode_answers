class Solution {
  func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    var top: Int = 0
    var right: Int = n - 1
    var bottom: Int = n - 1
    var left: Int = 0

    var visitCnt: Int = 1

    while top <= bottom && left <= right {
      // top iteration
      for col in left..<(right + 1) {
        matrix[top][col] = visitCnt
        visitCnt += 1
      }

      top += 1

      // right iteration
      for row in top..<(bottom + 1) {
        matrix[row][right] = visitCnt
        visitCnt += 1
      }

      right -= 1

      // bottom iteration
      if top <= bottom {
        for col in (left..<(right + 1)).reversed() {
          matrix[bottom][col] = visitCnt
          visitCnt += 1
        }

        bottom -= 1
      }

      // left iteration
      if left <= right {
        for row in (top..<(bottom + 1)).reversed() {
          matrix[row][left] = visitCnt
          visitCnt += 1
        }

        left += 1
      }
    }

    return matrix
  }
}
