class Solution {
  func numIslands(_ grid: [[Character]]) -> Int {
    let rowLen: Int = grid.count
    let columnLen: Int = grid[0].count

    var seenGrids = Array(repeating: Array(repeating: 0, count: columnLen), count: rowLen)
    var countIslands: Int = 0

    for row in 0..<rowLen {
      for column in 0..<columnLen {
        if seenGrids[row][column] == 1 || grid[row][column] == "0" {
          continue
        } else {
          bfs(row, column)
          countIslands += 1
        }
      }
    }

    func bfs(_ row: Int, _ column: Int) {
      guard row < rowLen, column < columnLen else { return }

      var queue: [Int] = []

      queue.append(row)
      queue.append(column)

      while !queue.isEmpty {
        let curRow: Int = queue.removeFirst()
        let curColumn: Int = queue.removeFirst()

        seenGrids[curRow][curColumn] = 1

        if curRow - 1 >= 0 && grid[curRow - 1][curColumn] == "1"
          && seenGrids[curRow - 1][curColumn] == 0
        {
          queue.append(curRow - 1)
          queue.append(curColumn)
          seenGrids[curRow - 1][curColumn] = 1
        }

        if curRow + 1 < rowLen && grid[curRow + 1][curColumn] == "1"
          && seenGrids[curRow + 1][curColumn] == 0
        {
          queue.append(curRow + 1)
          queue.append(curColumn)
          seenGrids[curRow + 1][curColumn] = 1
        }

        if curColumn - 1 >= 0 && grid[curRow][curColumn - 1] == "1"
          && seenGrids[curRow][curColumn - 1] == 0
        {
          queue.append(curRow)
          queue.append(curColumn - 1)
          seenGrids[curRow][curColumn - 1] = 1
        }

        if curColumn + 1 < columnLen && grid[curRow][curColumn + 1] == "1"
          && seenGrids[curRow][curColumn + 1] == 0
        {
          queue.append(curRow)
          queue.append(curColumn + 1)
          seenGrids[curRow][curColumn + 1] = 1
        }
      }
    }

    return countIslands
  }
}
