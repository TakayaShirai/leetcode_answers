class Solution {
  func islandPerimeter(_ grid: [[Int]]) -> Int {
    // BFS
    let startingLandCell: (Int, Int) = findFirstLandCell(in: grid)
    guard startingLandCell != (-1, -1) else { return 0 }

    var unvisitedLandQueue: [(Int, Int)] = []
    var visitedCells: [[Bool]] = Array(
      repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    var totalPerimeter: Int = 0

    unvisitedLandQueue.append(startingLandCell)
    visitedCells[startingLandCell.0][startingLandCell.1] = true

    let directions: [(Int, Int)] = [
      (-1, 0),
      (1, 0),
      (0, 1),
      (0, -1),
    ]

    while !unvisitedLandQueue.isEmpty {
      let curLandCell: (Int, Int) = unvisitedLandQueue.removeFirst()
      var curCellPerimeter: Int = 4

      for direction in directions {
        let newLandCellRow: Int = curLandCell.0 + direction.0
        let newLandCellCol: Int = curLandCell.1 + direction.1

        if isLand(row: newLandCellRow, col: newLandCellCol, in: grid) {
          curCellPerimeter -= 1

          if !visitedCells[newLandCellRow][newLandCellCol] {
            visitedCells[newLandCellRow][newLandCellCol] = true
            unvisitedLandQueue.append((newLandCellRow, newLandCellCol))
          }
        }
      }

      totalPerimeter += curCellPerimeter
    }

    return totalPerimeter

    // Double For Loop
    // var totalPerimeter: Int = 0

    // for row in 0..<grid.count {
    //     for col in 0..<grid[0].count {
    //         if grid[row][col] == 1 {
    //             totalPerimeter += countSurroundingsWater(row: row, col: col, in: grid)
    //         }
    //     }
    // }

    // return totalPerimeter
  }

  private func findFirstLandCell(in grid: [[Int]]) -> (Int, Int) {
    for row in 0..<grid.count {
      for col in 0..<grid[0].count {
        if grid[row][col] == 1 {
          return (row, col)
        }
      }
    }

    return (-1, -1)
  }

  private func isLand(row: Int, col: Int, in grid: [[Int]]) -> Bool {
    guard 0 <= row && row < grid.count && 0 <= col && col < grid[0].count else { return false }
    return grid[row][col] == 1
  }

  // private func countSurroundingsWater(row: Int, col: Int, in grid: [[Int]]) -> Int {
  //     let directions: [(Int, Int)] = [
  //         (-1, 0),
  //         (1, 0),
  //         (0, 1),
  //         (0, -1)
  //     ]
  //     var waterCount: Int = 0

  //     for direction in directions {
  //         let newRow: Int = row + direction.0
  //         let newCol: Int = col + direction.1

  //         if isWater(row: newRow, col: newCol, in: grid) {
  //             waterCount += 1
  //         }
  //     }

  //     return waterCount
  // }

  // private func isWater(row: Int, col: Int, in grid: [[Int]]) -> Bool {
  //     guard row >= 0 && row < grid.count && col >= 0 && col < grid[0].count else { return true }
  //     return grid[row][col] == 0
  // }
}
