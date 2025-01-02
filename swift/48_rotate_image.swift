class Solution {
  func rotate(_ matrix: inout [[Int]]) {
    // Easy Solution
    flipUpsideDown(&matrix)
    swapSymmetry(&matrix)

    // in-place (My first Solution)
    // var curLineLen: Int = matrix.count
    // var swappedCnt: Int = 0

    // var upGrid: (Int, Int) = (0, 0)
    // var rightGrid: (Int, Int) = (0, curLineLen - 1)
    // var downGrid: (Int, Int) = (curLineLen - 1, curLineLen - 1)
    // var leftGrid: (Int, Int) = (curLineLen - 1, 0)

    // while curLineLen > 0 {
    //     for _ in 0..<(curLineLen-1) {
    //         swapGrids(&matrix, &upGrid, &rightGrid, &downGrid, &leftGrid)
    //         updateGrids(&upGrid, &rightGrid, &downGrid, &leftGrid)
    //     }

    //     swappedCnt += 1
    //     curLineLen -= 2
    //     resetGrids(swappedCnt, curLineLen, &upGrid, &rightGrid, &downGrid, &leftGrid)
    // }

    // Not in-place
    // var copyMatrix: [[Int]] = matrix

    // for col in 0..<copyMatrix.count {
    //     for row in 0..<copyMatrix[0].count {
    //         let matrixCol: Int = row
    //         let matrixRow: Int = (matrix.count - 1) - col
    //         matrix[matrixCol][matrixRow] = copyMatrix[col][row]
    //     }
    // }
  }

  private func flipUpsideDown(_ matrix: inout [[Int]]) {
    var upCol: Int = 0
    var downCol: Int = matrix.count - 1
    let rowLen: Int = matrix.count

    while upCol < downCol {
      for row in 0..<rowLen {
        let tmpVal: Int = matrix[upCol][row]
        matrix[upCol][row] = matrix[downCol][row]
        matrix[downCol][row] = tmpVal
      }

      upCol += 1
      downCol -= 1
    }

    return
  }

  private func swapSymmetry(_ matrix: inout [[Int]]) {
    for col in 0..<matrix.count {
      for row in (col + 1)..<matrix[0].count {
        let tmp: Int = matrix[col][row]
        matrix[col][row] = matrix[row][col]
        matrix[row][col] = tmp
      }
    }
  }

  private func swapGrids(
    _ matrix: inout [[Int]],
    _ upGrid: inout (Int, Int),
    _ rightGrid: inout (Int, Int),
    _ downGrid: inout (Int, Int),
    _ leftGrid: inout (Int, Int)
  ) {
    var upGridVal: Int = matrix[upGrid.0][upGrid.1]
    var rightGridVal: Int = matrix[rightGrid.0][rightGrid.1]
    var downGridVal: Int = matrix[downGrid.0][downGrid.1]
    var leftGridVal: Int = matrix[leftGrid.0][leftGrid.1]

    matrix[upGrid.0][upGrid.1] = leftGridVal
    matrix[rightGrid.0][rightGrid.1] = upGridVal
    matrix[downGrid.0][downGrid.1] = rightGridVal
    matrix[leftGrid.0][leftGrid.1] = downGridVal

    return
  }

  private func updateGrids(
    _ upGrid: inout (Int, Int),
    _ rightGrid: inout (Int, Int),
    _ downGrid: inout (Int, Int),
    _ leftGrid: inout (Int, Int)
  ) {
    upGrid.1 += 1
    rightGrid.0 += 1
    downGrid.1 -= 1
    leftGrid.0 -= 1

    return
  }

  private func resetGrids(
    _ swappedCnt: Int,
    _ curLineLen: Int,
    _ upGrid: inout (Int, Int),
    _ rightGrid: inout (Int, Int),
    _ downGrid: inout (Int, Int),
    _ leftGrid: inout (Int, Int)
  ) {
    upGrid = (swappedCnt, swappedCnt)
    rightGrid = (swappedCnt, swappedCnt + curLineLen - 1)
    downGrid = (swappedCnt + curLineLen - 1, swappedCnt + curLineLen - 1)
    leftGrid = (swappedCnt + curLineLen - 1, swappedCnt)

    return
  }
}
