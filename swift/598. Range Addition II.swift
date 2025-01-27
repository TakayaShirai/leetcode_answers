class Solution {
  func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
    var minRow: Int = m
    var minCol: Int = n

    for cell in ops {
      let row: Int = cell[0]
      let col: Int = cell[1]

      minRow = min(minRow, row)
      minCol = min(minCol, col)
    }

    return minRow * minCol

    // Brute Force
    // var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    // var numToCntMap: [Int : Int] = [0 : m * n]
    // var maxVal: Int = 0

    // for cell in ops {
    //     let row: Int = cell[0]
    //     let col: Int = cell[1]

    //     for r in 0..<row {
    //         for c in 0..<col {
    //             numToCntMap[matrix[r][c], default: 0] -= 1
    //             matrix[r][c] += 1
    //             numToCntMap[matrix[r][c], default: 0] += 1
    //             maxVal = max(maxVal, matrix[r][c])
    //         }
    //     }
    // }

    // return numToCntMap[maxVal]!
  }
}
