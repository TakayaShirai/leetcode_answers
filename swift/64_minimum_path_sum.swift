class Solution {
  func minPathSum(_ grid: [[Int]]) -> Int {
    // 1. Create an m x n array to store the minimum cost to reach each grid cell.
    // 2. Initialize from the starting point (0, 0).
    // 3. For each grid cell (row, col), update the cost by considering two possible previous cells:
    //      - (row - 1, col): the cell directly above.
    //      - (row, col - 1): the cell directly to the left.
    // 4. Calculate the minimum cost to reach (row, col) as:
    //      min(cost(row - 1, col), cost(row, col - 1)) + grid(row, col).
    // 5. Continue this process until reaching the bottom-right corner (m - 1, n - 1).
    // 6. Return the cost at (m - 1, n - 1).

    var costMap: [[Int]] = Array(
      repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)

    for row in 0..<grid.count {
      for col in 0..<grid[0].count {
        costMap[row][col] = calcMinCost(row, col, grid, costMap)
      }
    }

    return costMap[grid.count - 1][grid[0].count - 1]
  }

  private func calcMinCost(_ row: Int, _ col: Int, _ grid: [[Int]], _ costMap: [[Int]]) -> Int {
    if row == 0 && col == 0 {
      return grid[row][col]
    }

    let upGridRow: Int = row - 1
    let leftGridCol: Int = col - 1

    let upGridCost: Int = upGridRow >= 0 ? costMap[upGridRow][col] : Int.max
    let leftGridCost: Int = leftGridCol >= 0 ? costMap[row][leftGridCol] : Int.max

    return grid[row][col] + min(leftGridCost, upGridCost)
  }
}
