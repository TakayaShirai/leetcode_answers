class Solution {
  func setZeroes(_ matrix: inout [[Int]]) {
    // Space: O(1)
    var zeroRow: Bool = false
    var zeroCol: Bool = false

    for row in 0..<matrix.count {
      for col in 0..<matrix[0].count {
        if matrix[row][col] == 0 {
          if row == 0 { zeroRow = true }
          if col == 0 { zeroCol = true }
          matrix[row][0] = 0
          matrix[0][col] = 0
        }
      }
    }

    for row in 1..<matrix.count {
      for col in 1..<matrix[0].count {
        if matrix[row][0] == 0 || matrix[0][col] == 0 {
          matrix[row][col] = 0
        }
      }
    }

    if zeroRow {
      for col in 0..<matrix[0].count {
        matrix[0][col] = 0
      }
    }

    if zeroCol {
      for row in 0..<matrix.count {
        matrix[row][0] = 0
      }
    }

    return

    // Set Space: O(m + n)
    // var zeroRows: Set<Int> = []
    // var zeroCols: Set<Int> = []

    // for row in 0..<matrix.count {
    //     for col in 0..<matrix[0].count {
    //         if matrix[row][col] == 0 {
    //             zeroRows.insert(row)
    //             zeroCols.insert(col)
    //         }
    //     }
    // }

    // for row in zeroRows {
    //     for col in 0..<matrix[0].count {
    //         matrix[row][col] = 0
    //     }
    // }

    // for col in zeroCols {
    //     for row in 0..<matrix.count {
    //         matrix[row][col] = 0
    //     }
    // }

    // return
  }
}
