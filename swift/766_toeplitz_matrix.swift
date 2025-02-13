class Solution {
  func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    for row in 0..<(matrix.count - 1) {
      var curRow: Int = row
      var curCol: Int = 0
      var prevVal: Int = matrix[curRow][curCol]

      while 0 <= curRow && curRow < matrix.count
        && 0 <= curCol && curCol < matrix[0].count
      {
        let curVal: Int = matrix[curRow][curCol]
        guard prevVal == curVal else { return false }

        curRow += 1
        curCol += 1
      }
    }

    for col in 0..<(matrix[0].count - 1) {
      var curRow: Int = 0
      var curCol: Int = col
      var prevVal: Int = matrix[curRow][curCol]

      while 0 <= curRow && curRow < matrix.count
        && 0 <= curCol && curCol < matrix[0].count
      {
        let curVal: Int = matrix[curRow][curCol]
        guard prevVal == curVal else { return false }

        curRow += 1
        curCol += 1
      }
    }

    return true
  }
}
