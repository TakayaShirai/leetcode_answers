class Solution {
  func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    let rowLen: Int = grid.count
    let columnLen: Int = grid[0].count

    var seenGrids = Array(repeating: Array(repeating: 0, count: columnLen), count: rowLen)
    var maxArea: Int = 0

    for row in 0..<rowLen {
      for column in 0..<columnLen {
        if seenGrids[row][column] == 1 || grid[row][column] == 0 {
          seenGrids[row][column] == 1
          continue
        } else {
          let curArea = bfs(row, column)
          maxArea = max(maxArea, curArea)
        }
      }
    }

    func bfs(_ row: Int, _ column: Int) -> Int {
      var area: Int = 1
      var queue = [(row: Int, column: Int)]()
      queue.append((row, column))
      seenGrids[row][column] = 1

      while !queue.isEmpty {
        let (curRow, curColumn) = queue.removeFirst()

        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        for direction in directions {
          let newRow = curRow + direction.0
          let newColumn = curColumn + direction.1

          if 0 <= newRow && newRow < rowLen && 0 <= newColumn && newColumn < columnLen
            && grid[newRow][newColumn] == 1 && seenGrids[newRow][newColumn] == 0
          {
            queue.append((newRow, newColumn))
            seenGrids[newRow][newColumn] = 1
            area += 1
          }
        }
      }

      return area
    }

    return maxArea
  }
}
