class Solution {
  func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    // Bottom up DP
    guard
      obstacleGrid[0][0] == 0
        && obstacleGrid[obstacleGrid.count - 1][obstacleGrid[0].count - 1] == 0
    else { return 0 }

    let rows = obstacleGrid.count
    let cols = obstacleGrid[0].count

    var uniquePathsCnts: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    uniquePathsCnts[rows - 1][cols - 1] = 1

    for i in (0..<rows).reversed() {
      for j in (0..<cols).reversed() {
        if obstacleGrid[i][j] == 1 {
          uniquePathsCnts[i][j] = 0
        } else {
          if i < rows - 1 {
            uniquePathsCnts[i][j] += uniquePathsCnts[i + 1][j]
          }
          if j < cols - 1 {
            uniquePathsCnts[i][j] += uniquePathsCnts[i][j + 1]
          }
        }
      }
    }

    return uniquePathsCnts[0][0]

    // Brute Force
    // var uniquePathsCnt: Int = 0
    // dfs(0, 0, obstacleGrid, &uniquePathsCnt)
    // return uniquePathsCnt
  }

  private func dfs(_ x: Int, _ y: Int, _ obstacleGrid: [[Int]], _ uniquePathsCnt: inout Int) {
    let maxX: Int = obstacleGrid.count - 1
    let maxY: Int = obstacleGrid[0].count - 1

    if x == maxX && y == maxY && obstacleGrid[x][y] == 0 {
      uniquePathsCnt += 1
      return
    }

    if x > maxX || y > maxY || obstacleGrid[x][y] == 1 {
      return
    }

    dfs(x + 1, y, obstacleGrid, &uniquePathsCnt)
    dfs(x, y + 1, obstacleGrid, &uniquePathsCnt)
  }
}
