class Solution {
  func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else { return [] }

    var result: [Int] = []
    var rowBegin = 0
    var rowEnd = matrix.count - 1
    var colBegin = 0
    var colEnd = matrix[0].count - 1

    while rowBegin <= rowEnd && colBegin <= colEnd {
      for col in colBegin..<(colEnd + 1) {
        result.append(matrix[rowBegin][col])
      }
      rowBegin += 1

      for row in rowBegin..<(rowEnd + 1) {
        result.append(matrix[row][colEnd])
      }
      colEnd -= 1

      if rowBegin <= rowEnd {
        for col in stride(from: colEnd, through: colBegin, by: -1) {
          result.append(matrix[rowEnd][col])
        }
      }
      rowEnd -= 1

      if colBegin <= colEnd {
        for row in stride(from: rowEnd, through: rowBegin, by: -1) {
          result.append(matrix[row][colBegin])
        }
      }
      colBegin += 1
    }

    return result
  }
}

// class Solution {
//     func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//         let directions: [(Int, Int)] = [
//             (0, 1),  // Move right
//             (1, 0),  // Move down
//             (0, -1), // Move left
//             (-1, 0)  // Move up
//         ]

//         let rows = matrix.count
//         let cols = matrix[0].count
//         var seenMatrix = Array(repeating: Array(repeating: false, count: cols), count: rows)
//         var result: [Int] = []

//         var curRow = 0, curCol = 0, curDirectionIdx = 0

//         for _ in 0..<(rows * cols) {
//             result.append(matrix[curRow][curCol])
//             seenMatrix[curRow][curCol] = true

//             let nextRow = curRow + directions[curDirectionIdx].0
//             let nextCol = curCol + directions[curDirectionIdx].1

//             if nextRow >= 0, nextRow < rows, nextCol >= 0, nextCol < cols, !seenMatrix[nextRow][nextCol] {
//                 curRow = nextRow
//                 curCol = nextCol
//             } else {
//                 curDirectionIdx = (curDirectionIdx + 1) % 4
//                 curRow += directions[curDirectionIdx].0
//                 curCol += directions[curDirectionIdx].1
//             }
//         }

//         return result
//     }
// }
