class Solution {
  func transpose(_ matrix: [[Int]]) -> [[Int]] {
    var curMatrix: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix.count), count: matrix[0].count)

    for row in 0..<matrix.count {
      for col in 0..<matrix[0].count {
        curMatrix[col][row] = matrix[row][col]
      }
    }

    return curMatrix
  }
}