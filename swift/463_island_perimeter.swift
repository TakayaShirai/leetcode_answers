class Solution {
  func islandPerimeter(_ grid: [[Int]]) -> Int {
    // BFS
    let firstLand: (Int, Int) = findLand(grid)
    if firstLand == (-1, -1) {
      return 0
    }

    var queue: [(Int, Int)] = []
    var seenLands: [[Bool]] = Array(
      repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    var perimeter: Int = 0

    queue.append(firstLand)
    seenLands[firstLand.0][firstLand.1] = true

    let directions: [(Int, Int)] = [
      (-1, 0),
      (1, 0),
      (0, 1),
      (0, -1),
    ]

    while !queue.isEmpty {
      let curLand: (Int, Int) = queue.removeFirst()
      var curPerimeter: Int = 4

      for direction in directions {
        let newLandRow: Int = curLand.0 + direction.0
        let newLandCol: Int = curLand.1 + direction.1

        if isLand(newLandRow, newLandCol, grid) {
          curPerimeter -= 1

          if !seenLands[newLandRow][newLandCol] {
            seenLands[newLandRow][newLandCol] = true
            queue.append((newLandRow, newLandCol))
          }
        }
      }

      perimeter += curPerimeter
    }

    return perimeter

    // Double For Loop
    // var perimeter: Int = 0

    // for row in 0..<grid.count {
    //     for col in 0..<grid[0].count {
    //         if grid[row][col] == 1 {
    //             perimeter += countSurroundingsWater(row, col, grid)
    //         }
    //     }
    // }

    // return perimeter
  }

  private func countSurroundingsWater(_ row: Int, _ col: Int, _ grid: [[Int]]) -> Int {
    let directions: [(Int, Int)] = [
      (-1, 0),
      (1, 0),
      (0, 1),
      (0, -1),
    ]
    var count: Int = 0

    for direction in directions {
      let newRow: Int = row + direction.0
      let newCol: Int = col + direction.1

      if isWater(newRow, newCol, grid) {
        count += 1
      }
    }

    return count
  }

  private func isWater(_ row: Int, _ col: Int, _ grid: [[Int]]) -> Bool {
    if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count {
      return true
    }

    return grid[row][col] == 0
  }

  private func findLand(_ grid: [[Int]]) -> (Int, Int) {
    for row in 0..<grid.count {
      for col in 0..<grid[0].count {
        if grid[row][col] == 1 {
          return (row, col)
        }
      }
    }

    return (-1, -1)
  }

  private func isLand(_ row: Int, _ col: Int, _ grid: [[Int]]) -> Bool {
    guard 0 <= row && row < grid.count && 0 <= col && col < grid[0].count else { return false }
    return grid[row][col] == 1
  }
}
