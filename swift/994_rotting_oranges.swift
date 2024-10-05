class Solution {
  func orangesRotting(_ grid: [[Int]]) -> Int {
    var grid = grid
    let rowLen = grid.count
    let colLen = grid[0].count

    var rottenOrangesPos: [(row: Int, column: Int)] = []
    var minimumMinutes: Int = 0

    for row in 0..<rowLen {
      for column in 0..<colLen {
        if grid[row][column] == 2 {
          rottenOrangesPos.append((row, column))
        }
      }
    }

    bfs()

    return checkExistRottenOrange(grid) ? -1 : minimumMinutes

    func bfs() {
      var queue: [(row: Int, column: Int)] = []

      for rottenOrangePos in rottenOrangesPos {
        queue.append(rottenOrangePos)
      }

      let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]

      while !queue.isEmpty {
        let queueLen = queue.count

        for _ in 0..<queue.count {
          let curPos = queue.removeFirst()
          let curRow = curPos.row
          let curCol = curPos.column

          if grid[curRow][curCol] == 2 {
            for direction in directions {
              let newRow = curRow + direction.0
              let newCol = curCol + direction.1

              if 0 <= newRow && newRow < rowLen && 0 <= newCol && newCol < colLen
                && grid[newRow][newCol] == 1
              {
                grid[newRow][newCol] = 2
                queue.append((newRow, newCol))
              }
            }
          }
        }

        if !queue.isEmpty {
          minimumMinutes += 1
        }
      }

      return
    }

    func checkExistRottenOrange(_ grid: [[Int]]) -> Bool {
      for row in 0..<grid.count {
        for column in 0..<grid[0].count {
          if grid[row][column] == 1 {
            return true
          }
        }
      }

      return false
    }
  }
}
