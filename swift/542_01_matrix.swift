class Solution {
  func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    let matRowLen: Int = mat.count
    let matColLen: Int = mat[0].count
    let maxDist: Int = matRowLen + matColLen
    var distToZero: [[Int]] = Array(
      repeating: Array(repeating: 0, count: matColLen), count: matRowLen)

    for row in 0..<matRowLen {
      for col in 0..<matColLen {
        guard mat[row][col] != 0 else { continue }
        let topCellDist: Int = row > 0 ? distToZero[row - 1][col] : maxDist
        let leftCellDist: Int = col > 0 ? distToZero[row][col - 1] : maxDist
        distToZero[row][col] = min(topCellDist, leftCellDist) + 1
      }
    }

    for row in (0..<matRowLen).reversed() {
      for col in (0..<matColLen).reversed() {
        guard mat[row][col] != 0 else { continue }
        let bottomCellDist: Int = row < (matRowLen - 1) ? distToZero[row + 1][col] : maxDist
        let rightCellDist: Int = col < (matColLen - 1) ? distToZero[row][col + 1] : maxDist
        distToZero[row][col] = min(distToZero[row][col], min(bottomCellDist, rightCellDist) + 1)
      }
    }

    return distToZero
  }
}
