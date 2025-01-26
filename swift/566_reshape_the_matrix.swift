class Solution {
  func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    let numOfCells: Int = mat.count * mat[0].count
    guard numOfCells == r * c else { return mat }

    var curRowCells: [Int] = []
    var reshapedMatrix: [[Int]] = []

    for row in 0..<mat.count {
      for col in 0..<mat[0].count {
        curRowCells.append(mat[row][col])

        if curRowCells.count == c {
          reshapedMatrix.append(curRowCells)
          curRowCells = []
        }
      }
    }

    return reshapedMatrix
  }
}
