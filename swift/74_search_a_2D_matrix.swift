class Solution {
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var firstRow: Int = 0
    var lastRow: Int = matrix.count - 1

    while firstRow <= lastRow {
      let midRow: Int = firstRow + (lastRow - firstRow) / 2

      if matrix[midRow][0] == target {
        return true
      } else if matrix[midRow][0] > target {
        lastRow = midRow - 1
      } else {
        firstRow = midRow + 1
      }
    }

    guard firstRow > 0 else { return false }
    let row: Int = firstRow - 1

    var firstCol: Int = 0
    var lastCol: Int = matrix[0].count - 1

    while firstCol <= lastCol {
      let midCol: Int = firstCol + (lastCol - firstCol) / 2

      if matrix[row][midCol] == target {
        return true
      } else if matrix[row][midCol] > target {
        lastCol = midCol - 1
      } else {
        firstCol = midCol + 1
      }
    }

    return false
  }
}
