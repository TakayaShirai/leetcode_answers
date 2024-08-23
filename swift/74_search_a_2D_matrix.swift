class Solution {
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var left: Int = 0
    var right: Int = matrix.count - 1
    var mid: Int = 0

    while left <= right {
      mid = (left + right) / 2

      if matrix[mid][0] == target {
        return true
      } else if matrix[mid][0] > target {
        right = mid - 1
      } else {
        left = mid + 1
      }
    }

    if left == 0 {
      return false
    }

    var row: Int = left - 1
    left = 0
    right = matrix[0].count - 1

    while left <= right {
      mid = (left + right) / 2

      if matrix[row][mid] == target {
        return true
      } else if matrix[row][mid] > target {
        right = mid - 1
      } else {
        left = mid + 1
      }
    }

    return false

  }
}
